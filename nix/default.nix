{
  buildGoApplication,
  git,
  lib,
  nix,
  version,
}:
buildGoApplication {
  inherit version;
  pname = "ux";
  src = lib.cleanSource ../.;
  modules = ./gomod2nix.toml;

  nativeBuildInputs = [
    git
    nix
  ];

  ldflags = [
    "-X github.com/unstoppablemango/ux/internal.Version=${version}"
  ];

  doCheck = false;

  meta = {
    description = "Universal codegen CLI";
    homepage = "https://github.com/UnstoppableMango/ux";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ UnstoppableMango ];
  };
}
