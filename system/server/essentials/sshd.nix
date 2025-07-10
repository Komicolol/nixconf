{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    # I should make this a system.essential instead...
    server.essentials.sshdstuff.enable = lib.mkEnableOption "enables sshd";
  };
  config = lib.mkIf config.server.essentials.sshdstuff.enable {
    services.openssh = {
      enable = true;
      Ports = [ 5124 ];
      openFirewall = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "komico" ];
      };
    };
  };
}
