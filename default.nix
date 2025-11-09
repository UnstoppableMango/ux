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
  lib,
  buildGoApplication ? pkgs.buildGoApplication,
}:

buildGoApplication rec {
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
        name = "UnstoppableMangoo";
        email = "erik.rasmussen@unmango.dev";
      }
    ];
  };
}
