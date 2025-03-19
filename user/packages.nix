{ config, lib, pkgs, inputs, ... }:

{
  options = {
    regularstuff.enable =
      lib.mkEnableOption "enables your shit";
  };
  config = lib.mkIf config.regularstuff.enable {
    environment.systemPackages = with pkgs; [
      # Random stuff that *might* be important
      age
      brightnessctl
      coreutils
      feh
      gvfs
      keepassxc
      libreoffice
      mpv
      nh
      obs-studio
      packwiz
      samba
      scrcpy
      spotify
      unzip
      vesktop
      vlc
      webex
      yt-dlp
      zip

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
