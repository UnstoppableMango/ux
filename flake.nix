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
	};

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      gomod2nix,
    }:
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Simple test check added to nix flake check
        go-test = pkgs.stdenvNoCC.mkDerivation {
          name = "go-test";
          dontBuild = true;
          src = ./.;
          doCheck = true;
          nativeBuildInputs = with pkgs; [
            go
						git
            writableTmpDirAsHomeHook
          ];
          checkPhase = ''
						export PATH="${pkgs.git}/bin:$PATH"
            go tool ginkgo run -r
          '';
          installPhase = ''
            mkdir "$out"
          '';
        };

        # Simple lint check added to nix flake check
        go-lint = pkgs.stdenvNoCC.mkDerivation {
          name = "go-lint";
          dontBuild = true;
          src = ./.;
          doCheck = true;
          nativeBuildInputs = with pkgs; [
            golangci-lint
            go
            writableTmpDirAsHomeHook
          ];
          checkPhase = ''
            go tool golangci-lint run
          '';
          installPhase = ''
            mkdir "$out"
          '';
        };
      in
      {
				formatter = pkgs.nixfmt-tree;

        checks = {
          inherit go-test go-lint;
        };
        packages.default = pkgs.callPackage ./. {
          inherit (gomod2nix.legacyPackages.${system}) buildGoApplication;
        };
        devShells.default = pkgs.callPackage ./shell.nix {
          inherit (gomod2nix.legacyPackages.${system}) mkGoEnv gomod2nix;
        };
      }
    ));
}
