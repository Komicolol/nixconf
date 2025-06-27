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
  ];
}
