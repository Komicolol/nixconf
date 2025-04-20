{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    user.wmde.hyprwm.enable =
      lib.mkEnableOption "enables hyprwm";
  };

  config = lib.mkIf config.user.wmde.hyprwm.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      hyprpaper
      hyprshot
      hypridle
      hyprlock
      waybar
      wl-clipboard
      pyprland
      rofi-wayland
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}
