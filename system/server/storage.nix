# yay, i love like 256gb of extra storage!!!

{ pkgs, lib, config, ... }: {
  options = {
    jellything.enable =
      lib.mkEnableOption "enables storage";
  };

  config = lib.mkIf config.storage.enable {

    # I'm not gonna lie, this look like too much effort LMAO
    # Just use syncthing or smth like idk man..
    services.samba = {
      enable = true;
      openFirewall = true;
    };
  };
}
