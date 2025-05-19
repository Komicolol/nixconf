{ config, lib, pkgs, ... }:

{
  options.server.for-the-funsies.gitea.enable = lib.mkEnableOption "baller";
  config = lib.mkIf config.server.for-the-funsies.gitea.enable {
    services.gitea = {
      enable = true;
      database.type = "sqlite3";
      lfs.enable = true;
      # make a password file or smth
      stateDir = "/var/lib/gitea";
      appName = "komico's git service";
      settings = {
        # session.COOKIE_SECURE = true;
        actions.ENABLED = true;
        metrics.ENABLED = true;
        repository = {
          DEFAULT_PUSH_CREATE_PRIVATE = true;
          DEFAULT_BRANCH = "main";
        };
        server = {
        HTTP_PORT = 3001;
        HTTP_ADDR = "127.0.0.1";
        DOMAIN = "localhost"; # until I get my own domain, I probably WONT use gitea.
        };
      };
    };
  };
}
