{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    user.devstuff.vmthings.enable =
      lib.mkEnableOption "enables vms to test :3";
  };

  config = lib.mkIf config.user.devstuff.vmthings.enable {
    programs.virt-manager.enable = true;
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}
