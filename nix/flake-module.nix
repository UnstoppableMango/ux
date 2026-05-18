{
  lib,
  flake-parts-lib,
  ...
}:
let
  inherit (lib) mkOption types;
  inherit (flake-parts-lib) mkPerSystemOption;
in
{
  options.perSystem = mkPerSystemOption (
    {
      config,
      pkgs,
      self',
      lib,
      ...
    }:
    {
      options.ux = {
        builders = mkOption {
          type = types.attrsOf types.package;
          default = { };
        };
        generate = mkOption {
          type = types.attrs;
          default = { };
        };
      };

      config.packages.uxCodegen = pkgs.callPackage ./codegen.nix {
        config = config.ux;
        ux = pkgs.ux or self'.packages.ux;
      };
    }
  );
}
