{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.server.storage.copyparty;
in
{


  options.server.storage.copyparty.enable = lib.mkEnableOption "it's popular :3";
  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.copyparty.overlays.default ];
    environment.systemPackages = [ pkgs.copyparty ];

    # passwords!
    sops.secrets.komicopassword = {
      sopsFile = ./secrets.yaml;
      owner = "copyparty";
    };
    sops.secrets.pubpassword = {
      sopsFile = ./secrets.yaml;
      owner = "copyparty";
    };

    services.copyparty = {
      enable = true;
      user = "copyparty";
      group = "copyparty";

      settings = {
        i = "0.0.0.0";
        p = [ 3030 3033 ];

        # global flags
        scan = 60;
        e2dsa = true; # file indexing, scans writable folders for new files and scans all mounted volumes
        e2ts = true; # metadata indexing, scans for tangs in all files w/o tags yte
        z = true; # zero conf
        df = "10g";
      };

      accounts = {
        komico.passwordFile = config.sops.secrets.komicopassword.path;
        pub.passwordFile = config.sops.secrets.pubpassword.path;
      };

      volumes = {
        "/" = {
          path = "/srv/copyparty/data";
          access = {
            rwmda = "komico";
          };
          flags = {
          };
        };

        "/public" = {
          path = "/srv/copyparty/public";
          access = {
            rw = "pub";
            rwmda = "komico";
          };
          flags = {
            nodupe = true;
            d2t = true; # disables multimedia parsers (incase of malicious uploads)
            xz = true;
          };
        };

        "/urstuff" = {
          path = "/srv/copyparty/public/uploads";
          access = {
            wG = "pub";
          };
          flags = {
            fk = 4;
            d2t = true; # disables multimedia parsers (incase of malicious uploads)
            xz = true;
          };

        };
      };
    };
  };
}
