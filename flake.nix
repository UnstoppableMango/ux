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
          inherit (pkgs.haskell.lib.compose) justStaticExecutables;
        in
        {
          packages = {
            ux = pkgs.callPackage ./nix { };
            # The executable without GHC and the library in its closure.
            default = justStaticExecutables self'.packages.ux;
          };

          checks = {
            inherit (self'.packages) ux;
          };

          devShells.default = pkgs.haskellPackages.shellFor {
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
