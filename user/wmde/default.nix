{ pkgs, lib, ...}: {

  imports = [
    ./hyprwm.nix
    ./xfce.nix
    ./sddm.nix
  ];
  sddmDM.enable =
    lib.mkDefault true;
}
