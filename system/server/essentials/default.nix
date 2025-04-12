{ config, lib, pkgs, ... }:

{
  imports = [
    ./syspkgs.nix
    ./sshd.nix
    ./docker.nix
    ./firewall.nix
    ./storagething.nix
    ./fail2ban.nix
  ];
  sshdstuff.enable =
      lib.mkDefault true;
}
