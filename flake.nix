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
      imports = with inputs; [ treefmt-nix.flakeModule ];

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

          checks.ux = self'.packages.ux;

          devShells.default = hpkgs.shellFor {
            packages = _: [ self'.packages.ux ];
            withHoogle = false;

            nativeBuildInputs = with pkgs; [
              direnv
              cabal-install
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

            settings.global.excludes = [ "gen/**" ];
          };
        };
    };
}
