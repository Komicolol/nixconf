{ config, lib, pkgs, ... }:

{
  options = {
    elephantQL.enable =
      lib.mkEnableOption "enables postgresql, what did you expect?";
  };

  config = lib.mkIf config.elephantQL.enable {
    services.postgresql.enable = true;
  };
}
