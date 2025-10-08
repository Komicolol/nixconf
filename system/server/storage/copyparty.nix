{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.server.storage.copyparty;
in {
  options.server.storage.copyparty.enable = lib.mkEnableOption "it's popular :3";
  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [inputs.copyparty.overlays.default];
    environment.systemPackages = [pkgs.copyparty];

    services.copyparty = {
      enable = true;
      user = "copyparty";
      group = "copyparty";

      settings = {
        # both reverse proxy AND lan support :3 (i tink)
        # i = "unix:770:www:/dev/shm/party.sock";
        i = "0.0.0.0";
        p = [3033];

        # global flags
        e2dsa = true; # file indexing, scans writable folders for new files and scans all mounted volumes
        e2ts = true; # metadata indexing, scans for tangs in all files w/o tags yte
        z = true; # zero conf
        df = "10g";
        xff-src = "lan";
        xff-hdr = "cf-connecting-ip";
      };

      accounts = {
        komico.passwordFile = config.sops.secrets."copyparty/komicopassword".path;
        pub.passwordFile = config.sops.secrets."copyparty/pubpassword".path;
      };

      groups = {
        admins = ["komico"];
        public = ["pub"];
      };

      volumes = {
        "/" = {
          path = "/srv/copyparty/data"; # ??? why ??? am i fucking stupid or smth??
          access = {
            A = "komico";
          };
          flags = {
          };
        };

        "/public" = {
          path = "/srv/copyparty/public";
          access = {
            rwg = "pub";
            A = "@admins";
          };
          flags = {
            fk = 4; # no violence! (bruteforce prot V)
            nodupe = true; # storage moment
            d2t = true; # disables multimedia parsers (incase of malicious uploads)
            xz = true; # jia tan
            opds = true; # i <3 books
          };
        };

        "/urstuff" = {
          path = "/srv/copyparty/uploads";
          access = {
            wG = "pub";
            A = "@admins";
          };
          flags = {
            fk = 4; # no violence! (bruteforce prot V)
            d2t = true; # disables multimedia parsers (incase of malicious uploads)
            xz = true; # jia tan
          };
        };
      };
    };
    # lan stuff
    networking.firewall.allowedTCPPorts = [3033];

    # data accessable to more than one program (e.g. immich, jellyfin)
    # users.users.copyparty.extraGroups = ["www"];

    # services.caddy.virtualHosts."localhost:3030".extraConfig = ''
    services.caddy.virtualHosts."cp.komico.dev".extraConfig = ''
      reverse_proxy http://0.0.0.0:3033 {
          header_down X-Real-IP {http.request.remote}
          header_down X-Forwarded-For {http.request.remote}
      }
    '';
    # passwords!
    sops.secrets."copyparty/komicopassword" = {
      sopsFile = ./secrets.yaml;
      owner = "copyparty";
      group = "copyparty";
    };
    sops.secrets."copyparty/pubpassword" = {
      sopsFile = ./secrets.yaml;
      owner = "copyparty";
      group = "copyparty";
    };
  };
}
