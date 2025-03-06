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

      ## I could probably do something better, but i didn't really make this useable for ppl
      ## other than me so :shrug:
      dataDir = "/home/komico/MCServers";

      servers = {
        survivalVanServer = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_4;

          serverProperties = {
            gamemode = "survival";
            simulation-distance = 10;

          };

          whitelist = {

          };

          jvmOpts = "-Xms2048M -Xmx6114M";

          symlinks = {

          };
        };
      };
    };

    ## Once I get a use for Tmux for other than MC, i'll put in directly in a seperate nix file.
    ## But for now, it'll live here.

    environment.systemPackages = with pkgs; [
      tmux
    ];
  };
}
