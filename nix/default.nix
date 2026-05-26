{
  buildGoApplication,
  git,
  globs,
  lib,
  nix,
  version,
}:
let
  fs = lib.fileset;
in
buildGoApplication {
  inherit version;
  pname = "ux";
  modules = ./gomod2nix.toml;

  src = fs.toSource {
    root = ../.;
    fileset = globs ../. [
      "go.mod"
      "go.sum"
      "**/*.go"
    ];
  };

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
