{ config, lib, pkgs, ... }:

{
  options = {
    myMariaDB.enable =
      lib.mkEnableOption "enables mariadb";
  };

  config = lib.mkIf config.myMariaDB.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
