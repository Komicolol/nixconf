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
    server.for-the-funsies.minecraftTs.enable =
      lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.server.for-the-funsies.minecraftTs.enable {
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
              url = "https://github.com/Komicolol/Modpacks/raw/refs/heads/main/pack.toml";
              packHash = "sha256-kizNGJc4wwTu/HTs4VLyWhxSFDSlD1LtfruZeSdioyE=";
            };
          in {
            "mods" = "${modpack}/mods";
          };
        };
      };
    };
  };
}
