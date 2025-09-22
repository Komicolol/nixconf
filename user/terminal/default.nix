{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    user.terminal.enable =
      lib.mkEnableOption "enables terminal";
  };

  config = lib.mkIf config.user.terminal.enable {
    environment.systemPackages = with pkgs; [
      kitty # wezterm might be cool idk
      wezterm # oh wow look at that
      btop
      starship
      cava
      cowsay
      fastfetch
      tmux
      yazi
      cbonsai
      ttyper # i get bored sometimes...
      cmatrix
      bottom # :33333333
      tealdeer
      duf
      dutree
      yt-dlp # mp3 bc opus no work with jellyfin
      packwiz # minecraft mods!!!
      dysk # better df
      gdu
      fzf # fuzzy finder
      nix-tree # i wanna look at nix-store
      ffmpeg # backend for (insert media editor here lmao)
      playerctl # beeps and boops make me happy
      pipes # i'm bored okkkk
    ];

    programs.zsh = {
      enable = lib.mkDefault true;

      # just adding autosuggestions..
      autosuggestions.enable = true;
      autosuggestions.async = true;
    };
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batman
        batdiff
      ];
    };
  };
}
