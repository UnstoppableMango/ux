{
  lib,
  config,
  flake-parts-lib,
  ...
}:
let
  inherit (lib) options types;
in
{
  options.ux = {
    builders = options.mkOption {
      type = types.attrsOf (types.functionTo types.package);
    };
    gen = options.mkOption {
      type = types.attrs;
    };
  };

  config.perSystem =
    {
      self',
      pkgs,
      lib,
      ...
    }:
    {
      packages.uxCodegen = pkgs.callPackage ./codegen.nix {
        config = config.ux;
        ux = pkgs.ux or self'.packages.ux;
      };
    };
}
