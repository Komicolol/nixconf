{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./syspkgs.nix
    ./sshd.nix
    ./docker.nix
    ./firewall.nix
    ./storagething.nix
    ./fail2ban.nix
  ];
  server.essentials.sshdstuff.enable =
    lib.mkDefault true;
}
