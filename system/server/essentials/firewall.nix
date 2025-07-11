{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    server.essentials.firewall.enable =
      lib.mkEnableOption "firewall things for syncthing mostly.";
  };
  config = lib.mkIf config.server.essentials.firewall.enable {
    # just firewall things :3
    networking.firewall.allowedTCPPorts = [ 8384 3000 3001 443 80 ];
    networking.firewall.allowedUDPPorts = [ 443 80 ]; # idk
  };
}
