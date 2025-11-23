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
        { pkgs, system, ... }:
        let
          ux = pkgs.callPackage ./. {
            inherit (inputs.gomod2nix.legacyPackages.${system}) buildGoApplication;
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

          devShells.default = pkgs.callPackage ./shell.nix {
            inherit (inputs.gomod2nix.legacyPackages.${system}) mkGoEnv gomod2nix;
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
