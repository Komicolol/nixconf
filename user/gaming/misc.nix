{ config, lib, pkgs, ... }:

{
  options.user.gaming.misc.enable = lib.mkEnableOption "random games n' shit";
  config = lib.mkIf config.user.gaming.misc.enable {
    environment.systemPackages = with pkgs; [
      osu-lazer-bin # click the circles!
      prismlauncher # minecraft gaming
    ];

    # roblox/minecraft bedrock LOL
    services.flatpak.enable = true;


  };
}
