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
    cloudflare-proxy.enable = true;
    cloudflare-np.enable = true;
    storage.copyparty.enable = true;

    essentials = {
      sshdstuff.enable = true;
      # about to be removed.
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
      mcVanServ.enable = true;
      immichphotos.enable = true;
      aiTypeShii.enable = false; # yuck.
      moneroYay.enable = false;
      webBooks.enable = true;
      calibre-server.enable = false;
      forgejo.enable = true;
    };
    webstuff.webpkgs.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lapserver"; # Define your hostname.

  system.stateVersion = "24.11"; # Did you read the comment? no
}
