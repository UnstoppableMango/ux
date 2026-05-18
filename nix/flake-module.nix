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

      config.packages.ux-config = pkgs.writeText "ux.json" (builtins.toJSON config.ux);
    }
  );
}
