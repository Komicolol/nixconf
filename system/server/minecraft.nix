# I FUCKING LOVE MINECRAFTTT
# you probably have to import this directly into the flake...

{ pkgs, lib, config, inputs, ... }: {
  options = {
    jellything.enable =
      lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.minecraft.enable {
    imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

    services.minecraft-servers = {
      enable = true;
      eula = true;

      dataDir = "/var/lib/minecraft";

      servers = {
        survivalVanServer = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_4;

          serverProperties ={

          };

          whitelist = {

          };

          symlinks = {
            "mods" = /var/lib/minecraft/mods;
          };
        };
      };
    };
  };
}
