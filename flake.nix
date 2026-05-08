{
  description = "Some codegen nonsense, idk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    gomod2nix = {
      url = "github:nix-community/gomod2nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.inputs.systems.follows = "systems";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem =
        {
          inputs',
          pkgs,
          system,
          lib,
          ...
        }:
        let
          inherit (inputs'.gomod2nix.legacyPackages) buildGoApplication;

          version = "0.1.0";
          ux = buildGoApplication {
            inherit version;
            pname = "ux";
            src = lib.cleanSource ./.;
            modules = ./gomod2nix.toml;

            nativeBuildInputs = with pkgs; [
              git
              nix
            ];

            ldflags = [
              "-X github.com/unstoppablemango/ux.Version=${version}"
            ];

            meta = {
              description = "Universal codegen CLI";
              homepage = "https://github.com/UnstoppableMango/ux";
              license = lib.licenses.mit;
              maintainers = with lib.maintainers; [ UnstoppableMango ];
            };
          };
        in
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              inputs.gomod2nix.overlays.default
            ];
          };

          packages = {
            inherit ux;
            default = ux;
          };

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              buf
              docker
              dprint
              git
              ginkgo
              gnumake
              gomod2nix
              nil
              nixfmt
              shellcheck
            ];
          };

          treefmt.programs = {
            nixfmt.enable = true;
            gofmt.enable = true;
            buf.enable = true;
          };
        };
    };
}
