{ lib, config, ... }:
{
  options.ux = {
    builders = lib.options.mkOption {
      type = lib.types.attrsOf lib.types.package;
    };
  };

  config.perSystem =
    { pkgs, lib, ... }:
    {
      legacyPackages.uxBuilders = config.ux.builders;
    };
}
