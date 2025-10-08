{
  config,
  lib,
  pkgs,
  ...
}: {
  # Yeah :3
  imports = [
      ../../user/devstuff
  ];

  # User options
  user.devstuff.devpkgs.enable = true;
  # terminal.enable = true;
  # devstuff.enable = true;

  # Something something, state vers.
  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  environment.etcBackupExtension = ".bak";
}
