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

  ## --- settings and presets and shit!!! --- ##
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

    gaming.steam.enable = false;
    gaming.misc.enable = false;

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
  # TODO: put this in either system.drivers.amd or something, ts looks ugly
  # as hell :wiltedrose:
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

 hardware.amdgpu.initrd.enable = true; # idk what it does but it looks pretty :3
 boot.kernelParams = [ "amd-pstate=active" ]; # haha pstate it sounds like something else

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
