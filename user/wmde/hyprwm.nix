{ pkgs, lib, config, ...}: {

  options = {
    hyprwm.enable = 
      lib.mkEnableOption "enables hyprwm";
  };

  config = lib.mkIf config.hyprwm.enable {
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
    extraPortals = [ pkgs.xdg-desktop-portal-gtk];
    };
  };
}
