{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./survivalServer.nix
  ];
}
