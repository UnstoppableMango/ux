{
  description = "Expressive artifact conversion pipelines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:UnstoppableMango/nix-systems";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Only the protos are read, for `make generate`.
    tdl = {
      url = "github:UnstoppableMango/tdl";
      flake = false;
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = with inputs; [
        systems.flakeModule or { }
        treefmt-nix.flakeModule
      ];

      perSystem =
        { pkgs, self', ... }:
        let
          hpkgs = pkgs.haskellPackages;
        in
        {
          packages = {
            ux = import ./nix {
              inherit (pkgs) haskell lib;
              haskellPackages = hpkgs;
            };
            # The executable without GHC and the library in its closure.
            default = pkgs.haskell.lib.compose.justStaticExecutables self'.packages.ux;
          };

          checks = {
            ux = self'.packages.ux;
            # nix/ux.nix is committed so evaluation needs no build (IFD).
            cabal2nix = pkgs.runCommand "ux-cabal2nix" { nativeBuildInputs = [ pkgs.cabal2nix ]; } ''
              cd ${self'.packages.ux.src}
              HOME=$TMPDIR cabal2nix . | diff -u ${./nix/ux.nix} - \
                || { echo "nix/ux.nix is stale; run make cabal2nix" >&2; exit 1; }
              touch $out
            '';
          };

          devShells.default = hpkgs.shellFor {
            packages = _: [ self'.packages.ux ];
            withHoogle = false;

            nativeBuildInputs = with pkgs; [
              direnv
              cabal-install
              cabal2nix
              hpkgs.haskell-language-server
              hpkgs.proto-lens-protoc
              protobuf
              gnumake
              nixfmt
            ];

            TDL_PROTO = "${inputs.tdl}/proto";
          };

          treefmt = {
            programs = {
              actionlint.enable = true;
              cabal-fmt.enable = true;
              nixfmt.enable = true;
              ormolu.enable = true;
            };

            settings.global.excludes = [
              "gen/**"
              "nix/ux.nix"
            ];
          };
        };
    };
}
