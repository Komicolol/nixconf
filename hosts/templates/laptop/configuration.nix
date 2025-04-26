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
    wmde = {
      xfceDE.enable = true;
    };
    devstuff = {
      devpkgs.enable = true;
      vmthing.enable = true;
      kanata.enable = true;
    };
  };

  server.essentials.sshdstuff.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "baller"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    curl
  ];

  ## Laptop-Specific Configs!

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
