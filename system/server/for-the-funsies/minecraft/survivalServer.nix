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
          package = pkgs.fabricServers.fabric-1_21_7.override {loaderVersion = "0.16.14";};

          serverProperties = {
            gamemode = "survival";
          };

          whitelist = {
          };

          jvmOpts = "-Xms2048M -Xmx6114M";

          symlinks = let
            modpack = pkgs.fetchPackwizModpack {
              url = "https://github.com/Komicolol/Modpacks/raw/refs/tags/v0.1.1/survival-thingy/pack.toml";
              packHash = lib.fakeSha256;
            };
          in {
            "mods" = "${modpack}/mods";
          };
        };
      };
    };
  };
}
