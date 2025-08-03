{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.server.for-the-funsies.mcLobby;
in
{
  options.server.for-the-funsies.mcLobby.enable = lib.mkEnableOption "lobby";
  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [inputs.nix-minecraft.overlay];

    services.minecraft-servers = {
      eula = true;
      openFirewall = true;

      servers = {
        lobby = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_7.override {loaderVersion = "0.16.14";};

          serverProperties = {
            server-port = 30068;
            white-list = true;
            online-mode = false;
          };

          whitelist = {
            Komico_ = "86c18ed8-cb4f-4ec0-a53e-135d17aa33e4";
          };
          jvmOpts = "-Xms1024M -Xmx2048M";

          symlinks = {
            mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
              fabricproxy-lite = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/8dI2tmqs/versions/AQhF7kvw/FabricProxy-Lite-2.9.0.jar";
                hash = "sha256-rD7GWblQWPPm8AUxIhkaKZSzmMh8c7KLAytQ+0M+eE4=";
              };
            });
          };
        };
      };
    };
  };
}
