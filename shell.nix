{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [
			docker
			git
			gnumake
			go
			yq-go
		];
}
