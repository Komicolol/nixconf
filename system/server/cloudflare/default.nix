{ config, lib, pkgs, ... }:

{
  imports = [
    ./proxy.nix
    ./noproxy.nix
    ./dyndnscopy.nix
  ];
}
