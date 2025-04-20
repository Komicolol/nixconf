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

  # system settings
  serverKernel.enable = true;

  # server settings
  minecraftTs.enable = true;
  jellything.enable = true;
  sshdstuff.enable = true;
  syspkgs.enable = true;
  dockerContainer.enable = true;
  immichphotos.enable = true;
  firewall.enable = true;

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
