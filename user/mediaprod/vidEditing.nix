{ config, lib, pkgs, ... }:

{
  options.user.mediaprod.vidEditing.enable = lib.mkEnableOption "yeah i don't know either man...";
  config = lib.mkIf config.user.mediaprod.vidEditing.enable {
    environment.systemPackages = with pkgs; [
      # edit
      davinci-resolve # only on x11, crashes my entire laptop on wayland and I have to restart it :wiltedrose:
      # idk some sfx/vfx thing. I don't edit for shit LMAOOO
    ];
  };
}
