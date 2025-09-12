{ config, lib, pkgs, ... }:

{
  options = { user.services.kanata.enable = lib.mkEnableOption "kanata keyboard thing"; };
  config = lib.mkIf config.user.services.kanata.enable {
    # it's here now.
    environment.systemPackages = with pkgs; [kanata];
    boot.kernelModules = ["uinput"];
    hardware.uinput.enable = true;
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

    # services.kanata = {
    #   # TODO: place ur kanta config here instead
    #   enable = true;
    # };
  };
}
