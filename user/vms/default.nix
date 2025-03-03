{ config, lib, pkgs, ... }:

{
  options = {
    vmthings.enable =
      lib.mkEnableOption "enables vms to test :3";
  };

  config = lib.mkIf config.vmthings.enable {
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["komico"];
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

  };

}
