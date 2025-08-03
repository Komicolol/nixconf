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

  ## --- Change this to system essentials --- ##
  server.essentials.sshdstuff.enable = true;
  server.for-the-funsies.mullvad.enable = true;

  ## -- Server Testing... -- ##
  # AAAAAAAAAAA
  server.for-the-funsies.mcProxy.enable = false;
  server.for-the-funsies.mcVanServ.enable = false;

  user = {
    regularstuff.enable = true;
    terminal.enable = true;
    services.weylusThing.enable = true;
    services.mpd.enable = true;

    wmde.sddmDM.enable = true;
    # gaming/light productivity
    wmde.hyprwm.enable = true;
    # school work/heavy productivity
    wmde.xfceDE.enable = true;
    # in the middle, might replace xfce+i3
    # nevermind, i'm just dum. (i put in ~DISPLAY: ":1"~ instead of ~DISPLAY ":1"~...)
    wmde.niri.enable = true;

    devstuff.devpkgs.enable = true;
    devstuff.vmthings.enable = true;
    devstuff.kanata.enable = true;

    ## --- fun stuff, disabled when i need to lock in :( --- ##
    gaming.steam.enable = true;
    gaming.misc.enable = true;

    mediaprod.drawing.enable = false;
    mediaprod.music.enable = false;
    mediaprod.vidEditing.enable = false;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-ca6cc950-61d2-43a5-b97a-025074e83e79".device = "/dev/disk/by-uuid/ca6cc950-61d2-43a5-b97a-025074e83e79";

  networking.hostName = "amogus"; # Define your hostname.

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
 boot.kernelParams = [
   "acpi_backlight=native" # something that's for sure
   "psmouse.synaptics_intertouch=0" # touchpad things???
 ];
 services.fstrim.enable = true; # ssd thing. I should look into it. NAHHH

  system.stateVersion = "24.11"; # Did you read the comment? no.
}
