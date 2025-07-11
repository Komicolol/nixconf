{ config, lib, pkgs, ... }:

{
  options.server.for-the-funsies.forgejo.enable = lib.mkEnableOption "baller";
  config = lib.mkIf config.server.for-the-funsies.forgejo.enable {
    services.forgejo = {
      enable = true;
      database.type = "mysql";
      lfs.enable = true;
      # make a password file or smth
      stateDir = "/var/lib/forgejo";
      appName = "komico's git service";

      dump = {
        enable = true;
        type = "tar.xz";
      };

      settings = {
        session.COOKIE_SECURE = true;
        actions.ENABLED = true;
        metrics.ENABLED = true;
        repository = {
          DEFAULT_PUSH_CREATE_PRIVATE = true;
          DEFAULT_BRANCH = "main";
        };
        server = {
          SSH_PORT = 22;
          HTTP_PORT = 3001;
          HTTP_ADDR = "192.168.1.122"; # i don't care anymore.
          ROOT_URL = "https://git.komico.dev/";
        # DOMAIN = "komico.dev"; # I got my own domain :3
        };
      };
    };
  };
}
