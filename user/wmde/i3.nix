{ config, lib, pkgs, ... }:

let
  cfg = config.user.wmde.i3;
in
{
  options.user.wmde.i3.enable = lib.mkEnableOption "thing";
  config = lib.mkIf cfg.enable {

    # xfce + i3 bc why not
    environment.systemPackages = with pkgs; [
      i3blocks
    ];

    services.xserver = {
      windowManager.i3.enable = true;
      # just to make sure yknow...
      desktopManager.xfce.enableXfwm = false;
      desktopManager.xfce.noDesktop = false;
    };
  };
}
