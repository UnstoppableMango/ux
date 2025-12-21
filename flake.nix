{
  description = "Some codegen nonsense, idk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    gomod2nix = {
      url = "github:nix-community/gomod2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      imports = [ inputs.treefmt-nix.flakeModule ];

      perSystem =
        {
          inputs',
          pkgs,
          system,
          lib,
          ...
        }:
        let
          ux = inputs'.gomod2nix.legacyPackages.buildGoApplication rec {
            pname = "ux";
            version = "0.0.12";
            src = ./.;
            modules = ./gomod2nix.toml;

            nativeBuildInputs = with pkgs; [
              git
              dotnetCorePackages.sdk_10_0
            ];

            ldflags = [
              "-X github.com/unstoppablemango/ux/internal.Version=${version}"
            ];

            checkPhase = ''
              go test ./... -ginkgo.label-filter="!E2E"
            '';

            meta = {
              description = "Universal codegen CLI";
              homepage = "https://github.com/UnstoppableMango/ux";
              license = lib.licenses.mit;
              maintainers = [
                {
                  name = "UnstoppableMango";
                  email = "erik.rasmussen@unmango.dev";
                }
              ];
            };
          };

          uxApp = {
            type = "app";
            program = ux + "/bin/ux";
            meta = ux.meta;
          };
        in
        {
          packages.ux = ux;
          packages.default = ux;

          apps.ux = uxApp;
          apps.default = uxApp;

          devShells.default =
            let
              inherit (inputs.gomod2nix.legacyPackages.${system}) mkGoEnv gomod2nix;
              goEnv = mkGoEnv { pwd = ./.; };
            in
            pkgs.mkShell {
              packages = with pkgs; [
                buf
                docker
                git
                gnumake
                goEnv
                gomod2nix
                shellcheck
              ];
            };

          treefmt = {
            projectRootFile = "flake.nix";
            programs = {
              nixfmt.enable = true;
              # dprint.enable = true;
              gofmt.enable = true;
              buf.enable = true;
            };
          };
        };
    };
}
