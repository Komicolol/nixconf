{ config, lib, pkgs, inputs, ... }:

{
    options = {
    server.for-the-funsies.mcCobblemon.enable =
      lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.server.for-the-funsies.mcCobblemon.enable {
    nixpkgs.overlays = [inputs.nix-minecraft.overlay];

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;

      servers = {
        survivalVanServer = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_1.override {loaderVersion = "0.16.14";};

          serverProperties = {
            gamemode = "survival";
            server-port = 30069;
            white-list = true;
            online-mode = false; # for velocity :33
            difficulty = 3;
            spawn-protection = 1;
          };


          whitelist = {
            Komico_ = "86c18ed8-cb4f-4ec0-a53e-135d17aa33e4";
          };

          jvmOpts = "-Xms2048M -Xmx6114M";

          symlinks = let
            modpack = pkgs.fetchPackwizModpack {
              url = "https://raw.githubusercontent.com/Komicolol/Modpacks/refs/heads/main/cobblemon/pack.toml";
              packHash = "sha256-sEnNGca9BQDRH2xb9YRSzk1LqWbE9dTGgOqob+/1LeI=";
            };
          in {
            "mods" = "${modpack}/mods";
          };
        };
      };
    };
  };
}
