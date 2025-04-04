{ pkgs, lib, inputs,  ...}: {

  imports = [
    ./hyprwm.nix
    ./xfce.nix
    ./sddm.nix
  ];
  sddmDM.enable =
    lib.mkDefault true;
  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

}
