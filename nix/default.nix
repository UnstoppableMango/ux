{
  haskell,
  haskellPackages,
  lib,
  ...
}:
let
  ux = haskellPackages.callPackage ./ux.nix { };

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
# ux.nix is cabal2nix's output for ux.cabal; `make cabal2nix` regenerates it.
haskell.lib.compose.overrideCabal { inherit src; } ux
