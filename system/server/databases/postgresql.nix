{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    server.databases.elephantQL.enable =
      lib.mkEnableOption "enables postgresql, what did you expect?";
  };

  config = lib.mkIf config.server.databases.elephantQL.enable {
    services.postgresql.enable = true;
  };
}
