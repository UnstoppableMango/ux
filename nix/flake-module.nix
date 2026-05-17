{ lib, config, ... }:
{
  options.ux = {
    builders = lib.options.mkOption {
      type = lib.types.attrs;
    };
  };

  config.perSystem =
    { pkgs, lib, ... }:
    {
      legacyPackages.uxBuilders = config.ux.builders;
    };
}
