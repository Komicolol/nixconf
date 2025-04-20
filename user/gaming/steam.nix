{
  config,
  lib,
  pkgs,
  ...
}: {
  options.user.gaming.steam.enable = lib.mkEnableOption "baller";

  config = lib.mkIf config.user.gaming.steam.enable {
    # games, infinite games, but no games
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    programs.gamemode.enable = true;
  };
}
