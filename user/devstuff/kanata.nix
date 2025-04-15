{ config, lib, pkgs, ... }:

{
  options = {
    user.devstuff.kanata.enable =
      lib.mkEnableOption "kanata type shit";
  };

  config = lib.mkIf config.user.devstuff.kanata.enable {
    environment.systemPackages = with pkgs; [ kanata ];
    boot.kernelModules = [ "uinput" ];
    hardware.uinput.enable = true;
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
  };
}
