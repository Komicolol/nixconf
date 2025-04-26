{ config, lib, pkgs, ... }:

{
  options.system.laptop.upower.enable = lib.mkEnableOption "baller";

  config = lib.mkIf config.system.laptop.upower.enable {
    services.upower = {
      enable = true;
      percentageLow = 15;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "Hibernate";
    };
  };
}
