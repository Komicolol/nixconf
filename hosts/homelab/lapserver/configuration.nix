# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../../system
    ];

  ## Server Options
  sshdstuff.enable = true;
  minecraftTs.enable = true;
  ineedstorage.enable = true;
  dockerContainer.enable = true;
  jellything.enable = true;
  syspkgs.enable = true;
  myMariaDB.enable = true;
  firewall.enable = true;
  # NOT ANYMORE BABYYYY
  immichphotos.enable = true;


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lapserver"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    wget
    git
    neovim
  ];


  system.stateVersion = "24.11"; # Did you read the comment?

}
