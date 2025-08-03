{ config, lib, pkgs, ... }:

{
  imports = [
    ./music.nix
    ./drawing.nix
    ./vidEditing.nix
  ];

  # I use these sometimes.
  environment.systemPackages = with pkgs; [
    openutau # teto...
    obs-studio # recording for no reason
    audacity # why is this here???
    blender # i WONT use this LMAO
  ];

}
