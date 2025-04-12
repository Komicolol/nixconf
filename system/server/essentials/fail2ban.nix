{ config, lib, pkgs, ... }:

{
  options = {
    ipBanner.enable =
      lib.mkEnableOption "fail2ban thing :3";
  };
  config = lib.mkIf config.ipBanner.enable {
    services.fail2ban.enable = true;
  };
}
