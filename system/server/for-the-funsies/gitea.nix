{ config, lib, pkgs, ... }:

{
  options.server.for-the-funsies.gitea.enable = lib.mkEnableOption "git thing YIPPEEE";
  config = lib.mkIf config.server.for-the-funsies.gitea.enable {
    services.gitea = {
      enable = true;
      appName = "baller yeahhh";
      database = {
        type = "sqlite3";
        password = "idk lmao";
      };
    };
  };
}
