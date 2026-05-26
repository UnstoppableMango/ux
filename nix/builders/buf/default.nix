{
  pkgs ? import <nixpkgs> { },
}:
{
  generate =
    input: config:
    pkgs.callPackage ./generate.nix {
      inherit input config;
    };
}
