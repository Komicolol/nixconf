{ config, lib, pkgs, ... }:

{
  options = {
    server.essentials.dockerContainer.enable =
      lib.mkEnableOption "enables docker";
  };

  config = lib.mkIf config.server.essentials.dockerContainer.enable {
    virtualisation.docker.enable = true;
  };

}
