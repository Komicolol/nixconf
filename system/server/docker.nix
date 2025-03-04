{ config, lib, pkgs, ... }:

{
  options = {
    dockerContainer.enable =
      lib.mkEnableOption "enables docker";
  };

  config = lib.mkIf config.dockerContainer.enable {
    virtualisation.docker.enable = true;
  };

}
