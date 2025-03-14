{ config, lib, pkgs, ... }:

{
  options = {
    xfceDE.enable =
      lib.mkEnableOption "enables xfce4 and thunar";
  };

  config = lib.mkIf config.xfceDE.enable {
    # Only since I havn't done it with hyprland yet...
    programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
    ];

    services.gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };

    services.xserver.enable = true;
    services.picom.enable = true;

    services.xserver.desktopManager.xfce.enable = true;
    services.xserver.displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };

    environment.systemPackages = with pkgs; [
      catppuccin-sddm
    ];

    services.xserver.xkb = {
      layout = "au";
      variant = "";
    };
  };
}
