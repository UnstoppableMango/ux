{
  pkgs ? import <nixpkgs> { },
  input,
  config,
}:
{
  generate = pkgs.callPackage ./generate.nix { inherit input config; };
}
