{ config, lib, pkgs, ... }:

{
  options.server.for-the-funsies.calibre-server.enable = lib.mkEnableOption "bruh.";
  config = lib.mkIf config.server.for-the-funsies.calibre-server.enable {
    services.calibre-server = {
      enable = true;
      openFirewall = true;
      port = 8809; # don't ask me why
    };
  };
}
