{ config, lib, pkgs, ... }:

{
  options = {
    sshdstuff.enable =
      lib.mkEnableOption "enables sshd";
  };
  config = lib.mkIf config.sshdstuff.enable {
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
