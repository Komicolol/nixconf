{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./weylusthing.nix
    ./mpd.nix
    # ./kanata.nix
    ./backup.nix
    ./printing.nix
    ./kanata.nix
  ];
}
