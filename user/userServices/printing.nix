{ config, lib, pkgs, ... }:

let
  cfg = config.user.services.printing;
in
{
  options.user.services.printing.enable = lib.mkEnableOption "aaa";
  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
