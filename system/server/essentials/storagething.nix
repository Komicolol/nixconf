# yay, i love like 256gb of extra storage!!!

{ pkgs, lib, config, ... }: {
  options = {
    server.essentials.ineedstorage.enable =
      lib.mkEnableOption "enables storage";
  };

  config = lib.mkIf config.server.essentials.ineedstorage.enable {

    # I'm not gonna lie, this look like too much effort LMAO
    # Just use syncthing or smth like idk man..

    # nvm im just stupid LMAO
    services.samba = {
      enable = true;
      openFirewall = true;

      shares.smbshare = {
        path = "/home/komico/smbshare";
        writable = "true";
        comment = "balls.";
      };
    };
    # why am i adding this to storage? I have no idea.
    services.logind.lidSwitch = "ignore";
  };
}
