{
  haskell,
  haskellPackages,
  lib,
}:
let
  src = lib.fileset.toSource {
    root = ../.;
    fileset = lib.fileset.unions [
      ../ux.cabal
      ../LICENSE
      ../README.md
      ../app
      ../gen
      ../src
      ../test
    ];
  };
in
# description, homepage, and license come from ux.cabal.
haskell.lib.compose.overrideCabal { mainProgram = "ux"; } (
  haskellPackages.callCabal2nix "ux" src { }
)
