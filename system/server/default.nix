{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./storagething.nix
    ./music.nix
    ./jellything.nix
    ./docker.nix
  ];
}
