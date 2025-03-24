{ config, lib, pkgs, ... }:

{
  imports = [
    ./syspkgs.nix
    ./sshd.nix
    ./docker.nix
    ./firewall.nix
    ./storagething.nix
  ];
  sshdstuff.enable =
      lib.mkDefault true;
}
