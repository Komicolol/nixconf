{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    user.regularstuff.enable =
      lib.mkEnableOption "enables your shit";
  };
  config = lib.mkIf config.user.regularstuff.enable {
    environment.systemPackages = with pkgs; [
      ## Random stuff that *might* be important
      age # more password stuff
      anki-bin # honestly, i should make a folder for everythingi need for school...
      blueman # bluetooth...
      brightnessctl # let there be light!!!
      coreutils # seems a bit important innit
      feh # backgrounds
      gvfs # for server file thing yeah
      keepassxc # passwords, yay!!
      libreoffice # aaa
      monero-gui # idk I can't even get any monero right now :sob:
      mpd-mpris # stupid aaaaa
      mpv # play thingy idk
      nwg-look # appearance thing YAYAYAYAYAY
      pulsemixer # why not :3
      samba # why do I have this?
      unzip # zip but no
      vesktop # better discord :3
      vlc # it seems important
      zathura # i <3 pdfs (LIKE THE FILE FORMAT NOT /THOSE/ PDF FILES WAITWIATWAIT)
      zip # very important yes
      vial # pre build ergo mech kbd :3
      waypaper # why tf have i been rawdogging wallpapers when this exists???
      wlsunset # eye hurts :(((
      jamesdsp # audio...
      jq # used for script: https://github.com/YaLTeR/niri/discussions/724#discussioncomment-13228472
      drawio # diagrams galore!!1
      davfs2 # webdav, for testing out copyparty lmao
      rclone # thing...
      koreader # reading /legally/ downloaded epubs :3

      # wayland things
      # moving to here bc i barely use hyprland anymore...
      waybar # bars on bars!!!
      wl-clipboard # copy and paste
      rofi # rofi
      swww # ?
      libcava # waybar thing

      # oh wow i wonder what this is all about....
      qbittorrent

      ## still haven't gotten home.nix configured yet but wtvr. (I don't think i ever will...)
      dracula-icon-theme
      catppuccin-gtk
      flat-remix-gtk

      # brower things
      brave # why firefox why
      qutebrowser # ty bread on penguin for introducting me to this <333
      inputs.zen-browser.packages."${system}".default # firefox, might not even use anymore...
    ];
  };
}
