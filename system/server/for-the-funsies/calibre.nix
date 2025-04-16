{ config, lib, pkgs, ... }:

{
  options = {
    server.for-the-funsies.webBooks.enable = lib.mkEnableOption "baller";
  };
  config = lib.mkIf config.server.for-the-funsies.webBooks.enable {
    # kinda stole this from nmasur (https://github.com/nmasur/dotfiles/blob/master/platforms/nixos/modules/nmasur/presets/services/calibre-web.nix)
    # but like now I have to redo everything bc their config is EXACTLY what I'm trying to so :sob:
    services.calibre-web = {
      enable = true;
      openFirewall = true;
      listen.ip = "0.0.0.0";
      options = {
        reverseProxyAuth.enable = false;
        enableBookConversion = true;
        enableBookUploading = true;
      };
    };
  };
}
