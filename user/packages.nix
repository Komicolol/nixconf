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
      ffmpeg # backend for (insert media editor here lmao)
      gvfs # for server file thing yeah
      keepassxc # passwords, yay!!
      libnotify # pomodoro thing...
      libreoffice # aaa
      monero-gui # idk I can't even get any monero right now :sob:
      mpd-mpris # stupid aaaaa
      mpv # play thingy idk
      nix-tree # i wanna look at nix-store
      nwg-look # appearance thing YAYAYAYAYAY
      obsidian # i needed a .md renderer...
      packwiz # minecraft mods!!!
      playerctl # beeps and boops make me happy
      pulsemixer # why not :3
      samba # why do I have this?
      scrcpy # yeah
      spotify # music pain :(
      strawberry # yum! (music player)
      unzip # zip but no
      vesktop # better discord :3
      vlc # it seems important
      yt-dlp # mp3 bc opus no work with jellyfin
      zathura # i <3 pdfs (LIKE THE FILE FORMAT NOT /THOSE/ PDF FILES WAITWIATWAIT)
      zip # very important yes
      styluslabs-write # I DIDN'T BUY THE TABLET JUST FOR OSU I SWEAR
      pdftowrite # for Write.
      dysk # better df

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
      inputs.zen-browser.packages."${system}".default # firefox, might not even use anymore...
    ];

    # :(
    programs.firefox.enable = false;
  };
}
