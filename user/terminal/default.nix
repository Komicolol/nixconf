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
      bat
    ];

    programs.zsh = {
      enable = lib.mkDefault true;

      # just adding autosuggestions..
      autosuggestions.enable = true;
      autosuggestions.async = true;
    };
  };
}
