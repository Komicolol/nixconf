{ config, lib, pkgs, ... }:

{
  options.user.mediaprod.music.enable = lib.mkEnableOption "for music thing";
  config = lib.mkIf config.user.mediaprod.music.enable {
    environment.systemPackages = with pkgs; [
      # i am probably never gonna make music, but just in case right..
      qsynth
      rosegarden
      hydrogen # drum
      ardour
      lmms
    ];
  };
}
