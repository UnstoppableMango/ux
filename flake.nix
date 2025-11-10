{
  description = "Some codegen nonsense, idk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gomod2nix = {
      url = "github:nix-community/gomod2nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      gomod2nix,
      treefmt-nix,
    }:
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        cli = pkgs.callPackage ./. {
          inherit (gomod2nix.legacyPackages.${system}) buildGoApplication;
        };
        app = {
          type = "app";
          program = cli + "/bin/ux";
          meta = cli.meta;
        };
        container = pkgs.callPackage ./container.nix { ux = cli; };
      in
      {
        formatter = treefmt-nix.lib.mkWrapper pkgs {
          projectRootFile = "flake.nix";
          programs = {
            nixfmt.enable = true;
            dprint.enable = true;
            gofmt.enable = true;
            buf.enable = true;
          };
        };

        packages = {
          inherit cli container;
          default = cli;
        };

        apps.ux = app;
        apps.default = app;

        devShells.default = pkgs.callPackage ./shell.nix {
          inherit (gomod2nix.legacyPackages.${system}) mkGoEnv gomod2nix;
        };
      }
    ));
}
