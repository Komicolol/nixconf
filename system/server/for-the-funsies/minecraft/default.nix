{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./survivalServer.nix
    ## I just don't want to right now.
    # ./mcProxy.nix
    # ./lobby.nix
    # ./cobblemon.nix # no.
  ];
}
