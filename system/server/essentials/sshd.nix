{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    server.essentials.sshdstuff.enable = lib.mkEnableOption "enables sshd";
  };
  config = lib.mkIf config.server.essentials.sshdstuff.enable {
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
