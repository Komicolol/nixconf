{ config, lib, pkgs, ... }:

let
  cfg = config.server.cloudflare-proxy;
in
{
  options.server.cloudflare-proxy.enable = lib.mkEnableOption "yayay";
  config = lib.mkIf cfg.enable {

    sops.secrets.cloudflare-api-token = {
        sopsFile = ../secrets.yaml;
    };

    services.cloudflare-dyndns = {
      enable = true;
      proxied = true;
      apiTokenFile = config.sops.secrets.cloudflare-api-token.path;
      domains = [
        "git.komico.dev"
        "jf.komico.dev"
        "ima.komico.dev"
        "cp.komico.dev"
      ];
    };
  };
}
