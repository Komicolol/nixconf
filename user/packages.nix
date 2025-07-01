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
      brightnessctl # let there be light!!!
      coreutils # seems a bit important innit
      feh # backgrounds
      gvfs # for server file thing yeah
      keepassxc # passwords, yay!!
      libreoffice # aaa
      mpv # play thingy idk
      packwiz # minecraft mods!!!
      samba # why do I have this?
      scrcpy # yeah
      spotify # music pain :(
      unzip # zip but no
      vesktop # better discord :3
      vlc # it seems important
      yt-dlp # mp3 bc opus no work with jellyfin
      zip # very important yes
      nwg-look # appearance thing YAYAYAYAYAY
      zathura # i <3 pdfs (LIKE THE FILE FORMAT NOT /THOSE/ PDF FILES WAITWIATWAIT)
      obsidian # i needed a .md renderer...
      monero-gui # idk I can't even get any monero right now :sob:
      calibre # books
      ffmpeg # backend for (insert media editor here lmao)
      strawberry # yum! (music player)
      pulsemixer # why not :3
      nix-tree # i wanna look at nix-store
      blueman # bluetooth...
      anki-bin # honestly, i should make a folder for everythingi need for school...
      libnotify # pomodoro thing...
      playerctl # beeps and boops make me happy
      mpd-mpris # stupid aaaaa

      # oh wow i wonder what this is all about....
      qbittorrent

      ## still haven't gotten home.nix configured yet but wtvr.
      dracula-icon-theme
      catppuccin-gtk
      flat-remix-gtk
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

      # brower things
      brave # why firefox why
      qutebrowser # ty bread on penguin for introducting me to this <333
      inputs.zen-browser.packages."${system}".default
    ];

    programs.firefox.enable = true;
  };
}
