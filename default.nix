{
  pkgs ? (
    let
      inherit (builtins) fetchTree fromJSON readFile;
      inherit ((fromJSON (readFile ./flake.lock)).nodes) nixpkgs gomod2nix;
    in
    import (fetchTree nixpkgs.locked) {
      overlays = [
        (import "${fetchTree gomod2nix.locked}/overlay.nix")
      ];
    }
  ),
  buildGoApplication ? pkgs.buildGoApplication,
}:

buildGoApplication {
  pname = "ux";
  version = "0.0.12";
  src = ./.;
  modules = ./gomod2nix.toml;

  nativeBuildInputs = with pkgs; [
    git
    dotnetCorePackages.sdk_10_0
  ];

  checkPhase = ''
    go test ./... -ginkgo.label-filter="!E2E"
  '';
}
