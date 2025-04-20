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
      audacity # idk i'm getting bored
      brave # why firefox why
      brightnessctl # let there be light!!!
      coreutils # seems a bit important innit
      feh # backgrounds
      gvfs # for server file thing yeah
      keepassxc # passwords, yay!!
      libreoffice # aaa
      mpv # play thingy idk
      nh # cool nix
      obs-studio # recording for no reason
      packwiz # minecraft mods!!!
      samba # why do I have this?
      scrcpy # yeah
      spotify # music pain :(
      unzip # zip but no
      vesktop # better discord
      vlc # it seems important
      webex # online thingy yay.
      yt-dlp # mp3 bc opus no work with jellyfin
      zip # very important yes
      nwg-look # appearance thing YAYAYAYAYAY
      zathura # i <3 pdfs (LIKE THE FILE FORMAT NOT /THOSE/ PDF FILES WAITWIATWAIT)
      obsidian # i needed a .md renderer...
      krita # drawing but like i never do lol
      monero-gui # idk I can't even get any monero right now :sob:
      drawio # diagrams for... something.
      calibre # books
      openvpn # i don't even use this LMAO

      # oh wow i wonder what this is all about....
      qbittorrent

      ## still haven't gotten home.nix configured yet but wtvr.
      dracula-icon-theme
      catppuccin-gtk

      ## inputs thingy :3
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
      inputs.zen-browser.packages."${system}".default
    ];

    programs.firefox.enable = true;
  };
}
