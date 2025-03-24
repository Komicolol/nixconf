{ config, lib, pkgs, ... }:

{
  imports = [
    ./postgresql.nix
    ./mysql.nix
  ];
}
