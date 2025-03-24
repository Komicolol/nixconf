{ config, lib, pkgs, ... }:

{
  options = {
    firewall.enable =
      lib.mkEnableOption "firewall things for syncthing mostly.";
  };
  config = {
     # syncthing thing.
    networking.firewall.allowedTCPPorts = [ 8384 ];
  };
}
