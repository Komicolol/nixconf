{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.kernel.serverKernel.enable =
      lib.mkEnableOption "baller!!!";
  };

  config = lib.mkIf config.system.kernel.serverKernel.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages;
      kernelParams = [
        "quiet"
        "splash"
      ];
    };
  };
}
