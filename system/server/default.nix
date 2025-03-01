{ config, lib, pkgs, ... }:

{
  imports = [
    ./minecraft.nix
    ./storage.nix
    ./music.nix
    ./jellyfin.nix
  ];
}
