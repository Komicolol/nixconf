{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    server.for-the-funsies.immichphotos.enable =
      lib.mkEnableOption "your welcome immich >:c jk love you";
  };

  config = lib.mkIf config.server.for-the-funsies.immichphotos.enable {
    services.immich = {
      enable = true;
      port = 2283;
      openFirewall = true;
      # you have got to be kidding me.
      host = "0.0.0.0";
    };
  };
}
