{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.kernel.zenKernel.enable =
      lib.mkEnableOption "balls";
  };

  config = lib.mkIf config.system.kernel.zenKernel.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
