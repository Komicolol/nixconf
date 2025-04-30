{ config, lib, pkgs, ... }:

{
  options.user.mediaprod.drawing.enable = lib.mkEnableOption "drawing thing";
  config = lib.mkIf config.user.mediaprod.drawing.enable {
    environment.systemPackages = with pkgs; [
      krita # drawing but like i never do lol
      drawio # diagrams for... something.
      gimp # photoshop (?)
    ];
  };
}
