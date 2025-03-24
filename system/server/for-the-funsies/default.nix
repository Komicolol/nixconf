{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # probably won't even use it ngl
    ./aiTypeShii.nix

    # same with this
    ./photosimmichyeah.nix

    # not for this one, i love mc <333
    ./minecraft.nix
    inputs.nix-minecraft.nixosModules.minecraft-servers

    # this, not so much.
    ./jellything.nix
  ];
}
