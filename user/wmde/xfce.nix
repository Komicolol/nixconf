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

    # xfce + i3 bc why not
    services.picom.enable = true;

    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      windowManager.i3.enable = true;
    };
    services.xserver.xkb = {
      layout = "au";
      variant = "";
    };
  };
}
