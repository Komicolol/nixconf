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
    laptop.upower.enable = true;
    kernel.zenKernel.enable = true;
  };

  server = {
    essentials.sshdstuff.enable = true;

    databases.myMariaDB.enable = false;

    for-the-funsies.mullvad.enable = true;
    for-the-funsies.gitea.enable = false;

    webstuff.webpkgs.enable = false;
  };

  user = {
    regularstuff.enable = true;
    terminal.enable = true;
    services.weylusThing.enable = true;

    mediaprod.drawing.enable = true;
    mediaprod.music.enable = true;
    mediaprod.vidEditing.enable = true;

    wmde.hyprwm.enable = true;
    wmde.xfceDE.enable = true;
    wmde.sddmDM.enable = true;

    gaming.steam.enable = true;
    gaming.misc.enable = true;

    devstuff.devpkgs.enable = true;
    devstuff.vmthings.enable = true;
    devstuff.kanata.enable = true;
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
  ];

  ## --- Amogus-Specific Configs! ---
  services.printing.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  # From nix wiki, i hope it works :(
  environment.variables={
    RUSTICL_ENABLE="radeonsi";
    ROC_ENABLE_PRE_VEGA = "1";
   };

 hardware.graphics = {
   enable = true;
   extraPackages = with pkgs; [
     mesa
     libva
     libvdpau-va-gl
     vulkan-loader
     vulkan-validation-layers
     amdvlk  # Optional: AMD's proprietary Vulkan driver
     mesa.opencl  # Enables Rusticl (OpenCL) support
     rocmPackages.clr.icd # aaa im scared :((
   ];
 };

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
