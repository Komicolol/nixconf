{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    server.essentials.syspkgs.enable =
      lib.mkEnableOption "syspkgs, might overwrite some user pkgs";
  };

  config = lib.mkIf config.server.essentials.syspkgs.enable {
    environment.systemPackages = with pkgs; [
      tmux
      btop
      cron
      yt-dlp # music bc why not.
      mullvad
      qbittorrent-cli
      moc # i need my "1 hour of silence occasionally broken by Pikmin" playing
      alsa-utils
    ];
  };
}
