{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../../system
    ./../../../user
  ];

  # System Settings
  system.kernel.zenKernel.enable = true;

  user = {
    regularstuff.enable = true;
    terminal.enable = true;
    services.weylusThing.enable = true;
    services.mpd.enable = true;

    wmde.hyprwm.enable = true;
    wmde.xfceDE.enable = true;
    wmde.sddmDM.enable = true;

    devstuff.devpkgs.enable = true;
    devstuff.vmthings.enable = true;
    devstuff.kanata.enable = true;

    ## --- fun stuff, disabled when i need to lock in :( --- ##
    gaming.steam.enable = true;
    gaming.misc.enable = true;

    mediaprod.drawing.enable = true;
    mediaprod.music.enable = true;
    mediaprod.vidEditing.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Destop-Specific Configs!
  networking.hostName = "cheeseburger"; # Define your hostname.

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
