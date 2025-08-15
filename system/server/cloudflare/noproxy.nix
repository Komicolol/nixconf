{ config, lib, pkgs, ... }:

let
  cfg = config.server.cloudflare-np;
in
{
  options.server.cloudflare-np.enable = lib.mkEnableOption "yayay";
  config = lib.mkIf cfg.enable {
    services.cloudflare-np = {
      enable = true;
      domains = [
        "ssh.komico.dev"
        "mc.komico.dev"
      ];
    };
  };
}
