# definately legal shows :3

{ pkgs, lib, config, ... }: {
  options = {
    jellything.enable =
      lib.mkEnableOption "enables jellying";
  };

  config = lib.mkIf config.jellything.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      user="komico";
    };

    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];
  };
}
