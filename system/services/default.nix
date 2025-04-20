{
  config,
  lib,
  pkgs,
  ...
}: {
  # TODO put this in a different file
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    user = "komico";
    dataDir = "/home/komico/";
    configDir = "/home/komico/.config/syncthing";
  };
}
