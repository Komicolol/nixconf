{ config, lib, pkgs, inputs, ... }:

let
    cfg = config.server.for-the-funsies.mcProxy;
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

          files = {
            "velocity.toml" = "./velocity.toml";
          };


          symlinks = {
            "plugins" = pkgs.linkFarmFromDrvs "plugins" (builtins.attrValues {
              Geyser = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/wKkoqHrH/versions/OsGLkqF5/Geyser-Velocity.jar";
                hash = "sha256-rD7GWblQWPPm8AUxIhkaKZSzmMh8c7KLAytQ+0M+eE4=";
              };
              # nvm am stupid...
              Floodgate = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/bWrNNfkb/versions/ps3IuRel/Floodgate-Fabric-2.2.5-b45.jar";
                hash = "sha256-EAS4psyT4oDYe4tmxWzgddQ3yOQlk+auZIoKKEQTP1Q=";
              };
            });
          };
        };
      };
    };
  };
}
