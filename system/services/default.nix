{ config, lib, pkgs, ... }:

{
  services.syncthing = {
  enable = true;
  openDefaultPorts = true;
  user = "komico";
  dataDir = "/home/komico/";
  configDir = "/home/komico/.config/syncthing";
  };
}
