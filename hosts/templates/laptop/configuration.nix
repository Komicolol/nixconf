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
  system.laptop.upower.enable = true;
  system.laptop.tlpSettings.enable = true;

  # more locked-in than desktop config
  user = {
    regularstuff.enable = true;
    terminal.enable = true;

    wmde.xfceDE.enable = true;
    wmde.sddmDM.enable = true;

    devstuff.devpkgs.enable = true;
    devstuff.vmthings.enable = true;
    devstuff.kanata.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Laptop-Specific Configs!
  networking.hostName = "baller"; # Define your hostname.

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
