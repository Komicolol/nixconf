{ config, lib, pkgs, ... }:

{
  options = { user.services.mpd.enable = lib.mkEnableOption "mpd as user"; };
  config = lib.mkIf config.user.services.mpd.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/komico/Music/";
      extraConfig = ''
      audio_output {
         type "pipewire"
         name "pipewire thing"
      }
      '';
      user = "komico";
    };
    systemd.services.mpd.environment = {
      XDG_RUNTIME_DIR = "/run/user/1000";
    };
  };
}
