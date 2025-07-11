{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardwareconfiguration.nix
    ./../../../system
  ];

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
      mcVanServ.enable = true;
      immichphotos.enable = true;
      aiTypeShii.enable = true;
      moneroYay.enable = false;
      webBooks.enable = true;
      calibre-server.enable = true;
      gitea.enable = true;
    };
  };
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
  };

  networking = {
    hostName = "vm1";
    networkmanager.enable = true;
  };
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
  ];

  system.stateVersion = "24.11";
}
