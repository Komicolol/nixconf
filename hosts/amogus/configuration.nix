{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../system
    ./../../user
  ];

  # why the FUCK did i do this. This is the worst mistake that i've done.
  system = {
    laptop.tlpSettings.enable = true;
    kernel.zenKernel.enable = true;
  };

  server = {
    essentials.sshdstuff.enable = true;
    databases.myMariaDB.enable = true;
    for-the-funsies.mullvad.enable = true;
    webstuff.webpkgs.enable = true;
  };

  user = {
    regularstuff.enable = true;
    terminal.enable = true;
    services.weylusThing.enable = true;
    wmde = {
      hyprwm.enable = true;
      xfceDE.enable = true;
      sddmDM.enable = true;
    };
    gaming = {
      steam.enable = true;
      misc.enable = true;
    };
    devstuff = {
      devpkgs.enable = true;
      vmthings.enable = true;
      kanata.enable = true;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-ca6cc950-61d2-43a5-b97a-025074e83e79".device = "/dev/disk/by-uuid/ca6cc950-61d2-43a5-b97a-025074e83e79";

  networking.hostName = "amogus"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    neovim
    git # git fetch bitches
    wget # do you use this?
    curl # *random script go!*
  ];

  ## Amogus-Specific Configs!
  services.printing.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
