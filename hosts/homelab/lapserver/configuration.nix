# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../../system
  ];
  # aaaaaaaaaa
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
      webBooks.enable = true;
      calibre-server.enable = false;
      # disabled until i get my own domain.
      gitea.enable = false;
    };
    webstuff = {
      webpkgs.enable = true;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lapserver"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    wget
    git
    neovim
  ];

  system.stateVersion = "24.11"; # Did you read the comment? no
}
