# used both nixpkgs and nmasurs stuff to do this, all credit to them!!

{ config, lib, pkgs, ... }:
let
  cfg = config.services.cloudflare-np;
in
{
  options.services.cloudflare-np = {
    enable = lib.mkEnableOption "tyep shit";
    domains = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = ''
        List of domain names to update records for.
      '';
    };
    frequency = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = "*:0/5";
    };
  };

  config = lib.mkIf cfg.enable {

  sops.secrets.cloudflare-api-token = {
      sopsFile = ../secrets.yaml;
   };

    systemd.services.cloudflare-np = {
      description = "CloudFlare Dynamic DNS Client - np";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      startAt = "*:0/5";

      environment = {
        CLOUDFLARE_DOMAINS = toString cfg.domains;
      };

      serviceConfig = {
        Type = "simple";
        DynamicUser = true;
        StateDirectory = "cloudflare-dyndns-np";
        Environment = [ "XDG_CACHE_HOME=%S/cloudflare-dyndns-np/.cache" ];
        LoadCredential = [
          "apiToken:${config.sops.secrets.cloudflare-api-token.path}"
        ];
      };

      script =
        let
          args = [
            "--cache-file /var/lib/cloudflare-dyndns-np/ip.cache"
          ]
          # :3
          ++ (if config.services.cloudflare-dyndns.ipv4 then [ "-4" ] else [ "-no-4" ])
          ++ (if config.services.cloudflare-dyndns.ipv6 then [ "-6" ] else [ "-no-6" ])
          ++ lib.optional config.services.cloudflare-dyndns.deleteMissing "--delete-missing";
        in
        ''
          export CLOUDFLARE_API_TOKEN_FILE=''${CREDENTIALS_DIRECTORY}/apiToken

          # Added 2025-03-10: `cfg.apiTokenFile` used to be passed as an
          # `EnvironmentFile` to the service, which required it to be of
          # the form "CLOUDFLARE_API_TOKEN=" rather than just the secret.
          # If we detect this legacy usage, error out.
          token=$(< "''${CLOUDFLARE_API_TOKEN_FILE}")
          if [[ $token == CLOUDFLARE_API_TOKEN* ]]; then
            echo "Error: your api token starts with 'CLOUDFLARE_API_TOKEN='. Remove that, and instead specify just the token." >&2
            exit 1
          fi

          exec ${lib.getExe pkgs.cloudflare-dyndns} ${toString args}
        '';
    };
  };
}
