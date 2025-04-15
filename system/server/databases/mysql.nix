{ config, lib, pkgs, ... }:

{
  options = {
    server.databases.myMariaDB.enable =
      lib.mkEnableOption "enables mariadb";
  };

  config = lib.mkIf config.server.databases.myMariaDB.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
