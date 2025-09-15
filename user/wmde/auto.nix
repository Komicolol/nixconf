{ config, lib, pkgs, ... }:

# uhh..... im sorry????
# nahh i'm not using this... for now...
# https://discourse.nixos.org/t/autologin-hyprland/38159/12

let
  cfg = config.user.wmde.auto-login;
  niri_s = "${pkgs.niri}/bin/niri-session";
  hypr_s = "${pkgs.hyprland}/bin/Hyprland";
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  init_cmd = if (config.user.wmde.niri.enable == true) then "${niri_s}"
             else (if (config.user.wmde.hyprland.enable == true) then "${hypr_s}"
             else "");
  default_cmd = "${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time --cmd ${init_cmd}";
in
{
  options.user.wmde.auto-login = {
    enable = lib.mkEnableOption "i can't be bothered.";
    user = lib.mkOption {
      type = lib.types.str;
      default = "komico"; # MEEEEE
    };
  };
  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "${init_cmd}";
          user = cfg.user;
        };
        default_session = {
          command = "${default_cmd}";
          user = "greeter";
        };
      };
    };
  };
}
