{ config, lib, pkgs, ... }:

{
  imports = [
    ./kanata.nix
    ./packages.nix
  ];
  kanata.enable =
    lib.mkDefault true;

  }
