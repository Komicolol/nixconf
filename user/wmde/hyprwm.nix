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
      waypaper # why tf have i been rawdogging wallpapers when this exists???
      hyprlang
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1"; # i feel like i've done this before..

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}
