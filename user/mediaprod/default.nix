{ config, lib, pkgs, ... }:

{
  # TODO make a file specific for what kind. (e.g. edit.nix for video edition)
  options.user.mediaprod.enable = lib.mkEnableOption "just some media making things, making it more organised yknow";
  config = lib.mkIf config.user.mediaprod.enable {
    environment.systemPackages = with pkgs; [
      krita # drawing but like i never do lol
      drawio # diagrams for... something.
      gimp # photoshop (?)

      # edit
      davinci-resolve # just nice to have yknow (my ass is NOT gonna edit shit :skull:)
      obs-studio # recording for no reason
      audacity # idk i'm getting bored

      # i am probably never gonna make music, but just in case right..
      qsynth
      rosegarden
      hydrogen # drum
      ardour
      lmms

      openutau # teto...
    ];
  };
}
