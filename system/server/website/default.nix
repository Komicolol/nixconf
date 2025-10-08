{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./webpkgs.nix
    ./proxy.nix
  ];
}
