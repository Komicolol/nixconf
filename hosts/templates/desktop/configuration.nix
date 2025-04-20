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
  tlpSettings.enable = true;

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
      vmthing.enable = true;
      kanata.enable = true;
    };
  };

  # Need sshd for secrets, disable this if you don't need it lmao
  server.essentials.sshdstuff.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cheeseburger"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    curl
  ];

  ## Destop-Specific Configs!

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
