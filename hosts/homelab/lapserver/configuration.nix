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

  # Server Options
  sshdstuff.enable = true;
  minecraftTs = true;
  ineedstorage.enable = true;
  dockerContainer.enable = true;
  musicthingy.enable = true;
  jellything.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lapserver"; # Define your hostname.

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "komico";

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    nh
  ];


  system.stateVersion = "24.11"; # Did you read the comment?

}
