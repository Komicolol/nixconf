{ config, lib, pkgs, ... }:

{
  options = {
    regularstuff.enable =
      lib.mkEnableOption "enables your shit";
  };
  config = lib.mkIf config.regularstuff.enable {
    environment.systemPackages = with pkgs; [
      ncmpcpp
      spotify
      webex
      keepassxc
      gvfs
      zip
      unzip
      coreutils
      brightnessctl
      libreoffice
      vesktop
      yt-dlp
      obs-studio
      feh
      vlc
    ];

    programs.firefox.enable = true;
  };
}
