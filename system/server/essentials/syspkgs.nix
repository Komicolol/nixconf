{ config, lib, pkgs, ... }:

{
  options = {
    server.essentials.syspkgs.enable =
      lib.mkEnableOption "syspkgs, might overwrite some user pkgs";
  };

  config = lib.mkIf config.server.essentials.syspkgs.enable {
    environment.systemPackages = with pkgs; [
      tmux
      btop
      nh
      cron
      yt-dlp # music bc why not.
    ];
  };
}
