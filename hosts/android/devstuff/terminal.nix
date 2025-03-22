{ config, lib, pkgs, ... }:


{
  options = {
    terminal.enable =
      lib.mkEnableOption "enables terminal";
  };

  config = lib.mkIf config.terminal.enable {
    environment.systemPackages = with pkgs; [
      btop
      starship
      cava
      cowsay
      fastfetch
      tmux
      yazi
      cbonsai
    ];
  };
}
