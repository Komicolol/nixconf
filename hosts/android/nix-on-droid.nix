{ config, lib, pkgs, ... }:

{
  # Yeah :3
  imports = [
    ./devstuff
  ];

  # User options
  terminal.enable = true;
  devstuff.enable = true;

  # Something something, state vers.
  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
 '';

  nixpkgs.config.allowUnfree = true;

  environment.etcBackupExtension = ".bak";
}
