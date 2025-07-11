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
        service.DISABLE_REGISTRATION = true;
        repository = {
          DEFAULT_PUSH_CREATE_PRIVATE = true;
          DEFAULT_BRANCH = "main";
          ACCESS_CONTROL_ALLOW_ORIGIN = "git.komico.dev";
        };
        server = {
          SSH_PORT = 5124;
          HTTP_PORT = 3001;
          HTTP_ADDR = "0.0.0.0"; # i don't care anymore.
          ROOT_URL = "https://git.komico.dev/";
        # DOMAIN = "komico.dev"; # I got my own domain :3
        };
      };
    };
  };
}
