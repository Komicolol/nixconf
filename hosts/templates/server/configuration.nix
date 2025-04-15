{ config, lib, pkgs, ... }:

{

  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../../system
  ];

  # Server Options
  server = {
    essentials = {
      sshdstuff.enable = true;
      ineedstorage.enable = true;
      dockerContainer.enable = true;
      syspkgs.enable = true;
      firewall.enable = true;
      ipBanner.enable = true;
    };
    databases = {
      myMariaDB.enable = true;
      elephantQL.enable = false;
    };

    for-the-funsies = {
      jellything.enable = true;
      minecraftTs.enable = true;
      immichphotos.enable = true;
      aiTypeShii.enable = true;
      moneroYay.enable = false;
      ILoveBooks.enable = true;
    };

    webstuff = {
      webpkgs.enable = true;
    };
  };


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
