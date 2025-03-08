{ config, lib, pkgs, inputs, ... }:

{
  options = {
    regularstuff.enable =
      lib.mkEnableOption "enables your shit";
  };
  config = lib.mkIf config.regularstuff.enable {
    environment.systemPackages = with pkgs; [
      nh
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
      samba
      # jellyfin-tui
      mpv
      age

      ## still haven't gotten home.nix configured yet but wtvr.
      dracula-icon-theme
      catppuccin-gtk

      ## inputs thingy :3
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
      # inputs.zen-browser.packages.${pkgs.system}.default
    ];

    programs.firefox.enable = true;

  };
}
