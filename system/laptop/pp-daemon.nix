{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.system.laptop.ppDaemon;
in {
  options.system.laptop.ppDaemon.enable = lib.mkEnableOption "ahahaha";
  config = lib.mkIf cfg.enable {
    # not compatable with tlp
    services.power-profiles-daemon.enable = true;
  };
}
