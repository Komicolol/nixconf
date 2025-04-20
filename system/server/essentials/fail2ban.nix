{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    server.essentials.ipBanner.enable =
      lib.mkEnableOption "fail2ban thing :3";
  };
  config = lib.mkIf config.server.essentials.ipBanner.enable {
    services.fail2ban.enable = true;
  };
}
