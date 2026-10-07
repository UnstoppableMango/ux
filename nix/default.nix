{
  buildGoApplication,
  lib,
  ginkgo,
  version,
}:
buildGoApplication {
  pname = "ux";
  inherit version;

  src = lib.cleanSource ../.;
  modules = ./gomod2nix.toml;

  ldflags = [ "-X main.version=${version}" ];

  nativeCheckInputs = [ ginkgo ];

  checkPhase = ''
    ginkgo run ./...
  '';

  meta = {
    description = "Expressive artifact conversion pipelines";
    homepage = "https://github.com/UnstoppableMango/ux";
    license = lib.licenses.mit;
    mainProgram = "ux";
  };
}
