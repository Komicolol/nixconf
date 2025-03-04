{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../system
      ./../../user
    ];

  # User options
  hyprwm.enable = true;
  xfceDE.enable = true;
  gaming.enable = true;
  devstuff.enable = true;
  regularstuff.enable = true;
  terminal.enable = true;
  vmthings.enable = true;

  # Server type shit
  minecraftTs.enable = false;

  # enable flakes you doofus
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-ca6cc950-61d2-43a5-b97a-025074e83e79".device = "/dev/disk/by-uuid/ca6cc950-61d2-43a5-b97a-025074e83e79";

  networking.hostName = "amogus"; # Define your hostname.

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "komico";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
       neovim 
       git				# git fetch bitches
       wget				# do you use this?
       curl				# *random script go!*
  ];

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
