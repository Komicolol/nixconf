{ config, lib, pkgs, ... }:

{
  options = {
    serverKernel.enable =
      lib.mkEnableOption "baller!!!";
  };

  config = lib.mkIf config.serverKernel.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages;
      kernelParams = [
        "quiet"
        "splash"
      ];
    };
  };
}
