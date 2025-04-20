{
  config,
  lib,
  pkgs,
  ...
}: {
  # :3
  imports = [
    ./terminal.nix
    ./devpkgs.nix
  ];
}
