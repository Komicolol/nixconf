{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardwareconfiguration.nix
      (import ./../../../system {inherit inputs;})
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
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  system.stateVersion = "24.11";
}
