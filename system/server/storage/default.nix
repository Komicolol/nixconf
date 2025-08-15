{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.copyparty.nixosModules.default
    ./copyparty.nix
    ./samba.nix
  ];
}
