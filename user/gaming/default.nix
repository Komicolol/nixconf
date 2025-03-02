{ config, lib, pkgs, ... }:

{
  options = {
    gaming.enable =
      lib.mkEnableOption "enables games";
  };

  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = with pkgs; [
      osu-lazer-bin # click the circles!
      prismlauncher # minecraft gaming
    ];

    # roblox/minecraft bedrock LOL

    services.flatpak.enable = true;

    # games, infinite games, but no games
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
