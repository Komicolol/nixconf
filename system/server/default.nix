{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # imports = [
  #   ./storagething.nix
  #   ./jellything.nix
  #   ./docker.nix
  #   ./minecraft.nix
  #   inputs.nix-minecraft.nixosModules.minecraft-servers
  #   ./sshd.nix
  #   ./syspkgs.nix
  #   ./mysql.nix
  #   ./postgresql.nix
  #   ./photosimmichyeah.nix
  #   ./firewall.nix
  #   ./aiTypeShii.nix
  # ];

  imports = [
    ./databases
    ./essentials
    ./for-the-funsies
    ./website
    ./storage
  ];
}
