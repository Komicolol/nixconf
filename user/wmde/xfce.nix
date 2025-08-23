{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    user.wmde.xfceDE = {
      enable = lib.mkEnableOption "enables xfce4 and thunar";
    };
  };

  config = lib.mkIf config.user.wmde.xfceDE.enable {
    # Only since I havn't done it with hyprland yet...
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];

    services.gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };

    environment.systemPackages = with pkgs; [
      picom-next
    ];
    services.xserver = {
      enable = true;
      enableTearFree = true; # bruh.
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = lib.mkDefault false;
          enableXfwm = lib.mkDefault true;
        };
      };
    };
    services.xserver.xkb = {
      layout = "au";
      variant = "";
    };
  };
}
