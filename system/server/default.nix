{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./storagething.nix
    ./jellything.nix
    ./docker.nix
    ./minecraft.nix
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./sshd.nix
    ./syspkgs.nix
    ./mysql.nix
  ];

  sshdstuff.enable =
      lib.mkDefault true;
}
