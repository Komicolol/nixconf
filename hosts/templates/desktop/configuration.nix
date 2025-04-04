{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../../system
      ./../../../user
    ];

  # System Settings
  tlpSettings.enable = true;

  # Turn these false if you don't need em.
  hyprwm.enable = true;
  xfceDE.enable = true;
  gaming.enable = true;
  devstuff.enable = true;
  regularstuff.enable = true;
  terminal.enable = true;
  vmthings.enable = true;

  # Need sshd for secrets, disable this if you don't need it lmao
  sshdstuff.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cheeseburger"; # Define your hostname.

  environment.systemPackages = with pkgs; [
       neovim
       git
       wget
       curl
  ];

  ## Destop-Specific Configs!

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
