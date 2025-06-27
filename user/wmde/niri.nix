{ config, lib, pkgs, ... }:

{
  options.user.wmde.niri.enable = lib.mkEnableOption "niri";
  config = lib.mkIf config.user.wmde.niri.enable {
    programs.niri.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    services.gnome.gnome-keyring.enable = true;
  };
}
