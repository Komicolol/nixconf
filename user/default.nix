# things that MIGHT be cross platform, i don't actually know tho...
{
  pkgs,
  lib,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./wmde
    ./gaming
    ./terminal
    ./devstuff
    ./packages.nix
    ./vms
    ./userServices
    ./mediaprod
  ];

services.udev = {

  packages = with pkgs; [
    qmk
    qmk-udev-rules # the only relevant
    qmk_hid
    via
    vial
  ]; # packages

}; # udev
}
