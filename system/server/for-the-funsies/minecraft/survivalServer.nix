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
            server-port = 30067;
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
              url = "https://github.com/Komicolol/Modpacks/raw/refs/tags/v0.1.2.1/survival-thingy/pack.toml";
              packHash = "sha256-sEnNGca9BQDRH2xb9YRSzk1LqWbE9dTGgOqob+/1LeI=";
            };
          in {
            "mods" = "${modpack}/mods";
          };
          # symlinks = {
          #   mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
          #     c2me = pkgs.fetchurl {
          #       url = "https://cdn.modrinth.com/data/VSNURh3q/versions/Erjpfj2l/c2me-fabric-mc1.21.7-0.3.4%2Bbeta.1.0.jar";
          #       # sha512 = "";
          #       sha512 = "6b0e363fc2d6cd2f73b466ab9ba4f16582bb079b8449b7f3ed6e11aa365734af66a9735a7203cf90f8bc9b24e7ce6409eb04d20f84e04c7c6b8e34f4cc8578bb";
          #     };
          #     Lithium = pkgs.fetchurl {
          #       url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/77EtzYFA/lithium-fabric-0.18.0%2Bmc1.21.7.jar";
          #       # sha512 = "";
          #       sha512 = "6b0e363fc2d6cd2f73b466ab9ba4f16582bb079b8449b7f3ed6e11aa365734af66a9735a7203cf90f8bc9b24e7ce6409eb04d20f84e04c7c6b8e34f4cc8578bb";
          #     };
          #     Fabric-api = pkgs.fetchurl {
          #       url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/JntuF9Ul/fabric-api-0.129.0%2B1.21.7.jar";
          #       # sha512 = "";
          #       sha512 = "6b0e363fc2d6cd2f73b466ab9ba4f16582bb079b8449b7f3ed6e11aa365734af66a9735a7203cf90f8bc9b24e7ce6409eb04d20f84e04c7c6b8e34f4cc8578bb";
          #     };
          #     fabricproxy-lite = pkgs.fetchurl {
          #       url = "https://cdn.modrinth.com/data/8dI2tmqs/versions/AQhF7kvw/FabricProxy-Lite-2.9.0.jar";
          #       # sha512 = "";
          #       sha512 = "6b0e363fc2d6cd2f73b466ab9ba4f16582bb079b8449b7f3ed6e11aa365734af66a9735a7203cf90f8bc9b24e7ce6409eb04d20f84e04c7c6b8e34f4cc8578bb";
          #     };
          #     ferritecore-fabric = pkgs.fetchurl {
          #       url = "https://cdn.modrinth.com/data/uXXizFIs/versions/CtMpt7Jr/ferritecore-8.0.0-fabric.jar";
          #       sha512 = "6b0e363fc2d6cd2f73b466ab9ba4f16582bb079b8449b7f3ed6e11aa365734af66a9735a7203cf90f8bc9b24e7ce6409eb04d20f84e04c7c6b8e34f4cc8578bb";
          #     };
          #     chunky = pkgs.fetchurl {
          #       url = "https://cdn.modrinth.com/data/fALzjamp/versions/inWDi2cf/Chunky-Fabric-1.4.40.jar";
          #       sha512 = "6b0e363fc2d6cd2f73b466ab9ba4f16582bb079b8449b7f3ed6e11aa365734af66a9735a7203cf90f8bc9b24e7ce6409eb04d20f84e04c7c6b8e34f4cc8578bb";
          #     };
          #   });
          # };
        };
      };
    };
  };
}
