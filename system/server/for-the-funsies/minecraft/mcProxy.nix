{ config, lib, pkgs, inputs, ... }:

let
    cfg = config.server.for-the-funsies.mcProxy.enable;
in
{
  options.server.for-the-funsies.mcProxy.enable = lib.mkEnableOption "velocity";
  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [inputs.nix-minecraft.overlay];
    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;

      servers = {
        velocityProxy = {
          enable = true;
          package = pkgs.velocityServers.velocity;

          serverProperties = {
            server-port = 25565;
          };
          symlinks = {
            "plugins" = pkgs.linkFarmFromDrvs "plugins" (builtins.attrValues {
              Geyser = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/wKkoqHrH/versions/OsGLkqF5/Geyser-Velocity.jar";
                hash = lib.fakeHash;
              };
              # why no modrinth ???
              Floodgate = pkgs.fetchurl {
                url = "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/velocity";
                hash = lib.fakeHash;
              };
            });
          };
        };
      };
    };
  };
}
