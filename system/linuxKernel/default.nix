{ config, lib, pkgs, ... }:

{
  # honestly, this could've /probably/ been custom config, but oh well :3
  imports = [
    ./zenKernel.nix
    ./serverKernel.nix
  ];
}
