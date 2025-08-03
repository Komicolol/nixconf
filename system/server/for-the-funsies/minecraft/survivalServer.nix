# I FUCKING LOVE MINECRAFTTT
# you probably have to import this directly into the flake...
{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    server.for-the-funsies.mcVanServ.enable =
      lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.server.for-the-funsies.mcVanServ.enable {
    nixpkgs.overlays = [inputs.nix-minecraft.overlay];

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;

      servers = {
        survivalVanServer = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_8.override {loaderVersion = "0.16.14";};

          serverProperties = {
            gamemode = "survival";
            server-port = 25565;
            white-list = true;
            online-mode = true; # for velocity :33 (nvm :<)
            difficulty = 3;
            spawn-protection = 1;
            motd = "I LOVE MINECRAFT :3333";
          };


          whitelist = {
            Komico_ = "86c18ed8-cb4f-4ec0-a53e-135d17aa33e4";
          };

          jvmOpts = "-Xms2048M -Xmx6114M";

          symlinks = let
            modpack = pkgs.fetchPackwizModpack {
              url = "https://github.com/Komicolol/Modpacks/raw/refs/tags/v0.2/survival-thingy/pack.toml";
              packHash = "sha256-OUK2dZ8o3b6X+g0zsblMK6PbUv5rS98u5eG5dD75kIE=";
            };
          in {
            "mods" = "${modpack}/mods";
            # TODO: add server-icon...
          };
        };
      };
    };
  };
}
