{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../system
      ./../../user
    ];

  # System Settings
  tlpSettings.enable = true;

  # User options
  hyprwm.enable = true;
  xfceDE.enable = true;
  gaming.enable = false;
  devstuff.enable = true;
  regularstuff.enable = true;
  terminal.enable = true;
  vmthings.enable = true;

  # Server type shit
  minecraftTs.enable = false;
  sshdstuff.enable = true;
  myMariaDB.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-ca6cc950-61d2-43a5-b97a-025074e83e79".device = "/dev/disk/by-uuid/ca6cc950-61d2-43a5-b97a-025074e83e79";

  networking.hostName = "amogus"; # Define your hostname.


  environment.systemPackages = with pkgs; [
       neovim 
       git				# git fetch bitches
       wget				# do you use this?
       curl				# *random script go!*
  ];

  ## Amogus-Specific Configs!
  services.printing.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
