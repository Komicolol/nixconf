# I FUCKING LOVE MINECRAFTTT
# you probably have to import this directly into the flake...

{ pkgs, lib, config, inputs, ... }: {
  options = {
    minecraftTs.enable =
      lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.minecraftTs.enable {
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;

      servers = {
        survivalVanServer = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_4;

          serverProperties ={

          };

          whitelist = {

          };

          symlinks = {
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      tmux
    ];
  };
}
