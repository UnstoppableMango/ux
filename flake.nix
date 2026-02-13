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
          inherit (inputs'.gomod2nix.legacyPackages) buildGoApplication mkGoEnv;
          goEnv = mkGoEnv { pwd = ./.; };

          ux = buildGoApplication rec {
            pname = "ux";
            version = "0.0.13";
            src = ./.;
            modules = ./gomod2nix.toml;

            nativeBuildInputs = with pkgs; [
              git
            ];

            ldflags = [
              "-X github.com/unstoppablemango/ux/Version=${version}"
            ];

            checkPhase = ''
              go test ./... -ginkgo.label-filter="!E2E"
            '';

            meta = {
              description = "Universal codegen CLI";
              homepage = "https://github.com/UnstoppableMango/ux";
              license = lib.licenses.mit;
              maintainers = with lib.maintainers; [ UnstoppableMango ];
            };
          };

          ctr = pkgs.dockerTools.buildImage {
            name = "ux";
            tag = "latest";

            copyToRoot = pkgs.buildEnv {
              name = "image-root";
              paths = [ ux ];
              pathsToLink = [ "/bin" ];
            };

            config = {
              Cmd = [ "/bin/ux" ];
            };
          };

          uxApp = {
            type = "app";
            program = ux + "/bin/ux";
            meta = ux.meta;
          };
        in
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              inputs.gomod2nix.overlays.default
            ];
          };

          packages.ux-image = ctr;
          packages.ux = ux;
          packages.default = ux;

          apps.ux = uxApp;
          apps.default = uxApp;

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              docker
              ginkgo
              git
              gnumake
              goEnv
              gomod2nix
              nil
              nixfmt
              shellcheck
            ];
          };

          treefmt = {
            projectRootFile = "flake.nix";
            programs = {
              nixfmt.enable = true;
              gofmt.enable = true;
            };
          };
        };
    };
}
