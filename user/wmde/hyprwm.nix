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
      pyprland
      hyprpicker
      # wayland things
      waybar # bars on bars!!!
      wl-clipboard # copy and paste
      rofi-wayland # rofi
      swww # ?
      libcava # waybar thing
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}
