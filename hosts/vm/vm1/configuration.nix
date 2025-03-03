{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardwareconfiguration.nix
      ./../../../system
    ];
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
  };

  networking = {
    hostName = "vm1";
    networkmanager.enable = true;
  };
  services.xerver.xkb = {
    layout = "au";
    varient = "";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  system.stateVersion = "24.11";
}
