{
  pkgs ? import <nixpkgs> { },
}:
{
  generate = pkgs.callPackage ./generate.nix { inherit input config; };
}
