{ config, lib, pkgs, ... }:

{
  options = {
    zenKernel.enable =
      lib.mkEnableOption "balls";
  };

  config = lib.mkIf config.zenKernel.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
