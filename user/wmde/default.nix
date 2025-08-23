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
  ];
  user.wmde.sddmDM.enable =
    lib.mkDefault true;
  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  programs.dconf.enable = true; # ???
}
