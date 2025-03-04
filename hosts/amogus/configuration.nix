# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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
       kdePackages.sddm				# LET ME THE FUCK INNNN
       picom				# x11 thing
       catppuccin-sddm
       dracula-icon-theme			# what a icon fr
       catppuccin-gtk				# :3333
       pyprland					# plugins for hyprland
       inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
       inputs.zen-browser.packages.${pkgs.system}.default
  ];



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
