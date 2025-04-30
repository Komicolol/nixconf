{ config, lib, pkgs, ... }:

{
  options.user.mediaprod.vidEditing.enable = lib.mkEnableOption "yeah i don't know either man...";
  config = lib.mkIf config.user.mediaprod.vidEditing.enable {
    environment.systemPackages = with pkgs; [
      # edit
      davinci-resolve # just nice to have yknow (my ass is NOT gonna edit shit :skull:)
    ];
  };
}
