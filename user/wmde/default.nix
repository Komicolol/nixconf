{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprwm.nix
    ./xfce.nix
    ./sddm.nix
    ./niri.nix
    ./i3.nix
    ./auto.nix
  ];
  user.wmde.sddmDM.enable =
    lib.mkDefault true;
  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
  user.wmde.auto-login.enable = lib.mkForce false;

  programs.dconf.enable = true; # ???
}
