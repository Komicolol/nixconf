{ config, lib, pkgs, ... }:

# https://discourse.nixos.org/t/autologin-hyprland/38159/12

let
  cfg = config.user.wmde.niri;
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  session = "${pkgs.niri}/bin/niri-session";
  username = "komico"; # TODO: no hardcoding stuff
in
{
  options.user.wmde.niri.enable = lib.mkEnableOption "niri";
  options.user.wmde.niri.autoLogin = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    environment.systemPackages = with pkgs; [
      swaylock-effects
      swaybg
      swayidle
      xwayland-satellite
    ];

    services.gnome.gnome-keyring.enable = true;

    services.greetd = {
      enable = cfg.autoLogin;
      settings = {
        initial_session = {
          command = "${session}";
          user = "${username}";
        };
        default_session = {
          command = "${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd ${session}";
          user = "greeter";
        };
      };
    };
  };
}
