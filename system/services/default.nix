{ config, lib, pkgs, ... }:

{
  services.syncthing = {
  enable = true;
  openDefaultPorts = true;
  guiAddress = "0.0.0.0:8384";
  user = "komico";
  dataDir = "/home/komico/";
  configDir = "/home/komico/.config/syncthing";
  };
}
