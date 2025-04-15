{ config, lib, pkgs, ... }:

{
  options = {
    server.essentials.firewall.enable =
      lib.mkEnableOption "firewall things for syncthing mostly.";
  };
  config = lib.mkIf config.server.essentials.firewall.enable {
     # syncthing thing.
    networking.firewall.allowedTCPPorts = [ 8384 3000 ];
  };
}
