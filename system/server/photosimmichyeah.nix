{ config, lib, pkgs, ... }:

{
 options = {
    immichphotos.enable =
      lib.mkEnableOption "your welcome immich >:c jk love you";
  };

  config = lib.mkIf config.immichphotos.enable {
    services.immich= {
      enable = true;
      openFirewall = true;
      port = 2283;
    };
  };
}
