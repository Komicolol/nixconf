{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    (import ./minecraft.nix {inherit inputs;})
    ./storage.nix
    ./music.nix
    ./jellyfin.nix
    ./docker.nix
  ];
}
