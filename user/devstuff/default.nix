{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./kanata.nix
    ./packages.nix
  ];
  user.devstuff.kanata.enable =
    lib.mkDefault true;
}
