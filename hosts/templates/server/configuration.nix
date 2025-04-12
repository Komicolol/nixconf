{ config, lib, pkgs, ... }:

{

  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../../system
  ];

  # Server Options
  sshdstuff.enable = true;
  minecraftTs.enable = true;
  ineedstorage.enable = true;
  dockerContainer.enable = true;
  jellything.enable = true;
  syspkgs.enable = true;
  myMariaDB.enable = true;
  immichphotos.enable = true;
  elephantQL.enable = true;
  ipBanner.enable = true;
  webpkgs.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "servertemplate"; # Define your hostname.


  environment.systemPackages = with pkgs; [
    wget
    git
    neovim
  ];
  system.stateVersion = "24.11"; # Did you read the comment? no.
}
