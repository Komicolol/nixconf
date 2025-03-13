{ config, lib, pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPasswordFile = config.sops.secrets.rootpasswd.path;
      };
      komico = {
        isNormalUser = true;
        description = "komico";
        hashedPasswordFile = config.sops.secrets.komico-passwd.path;
        extraGroups = [
          "networkmanager"
          "wheel"
          "input"
          "uinput"
          "docker"
          "minecraft"
          "mysql"
          "libvirtd"
        ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          # if you are gonna use this config (dont.), probably change this.
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINe7nKpSZT4fTO1sJoJLGhRJVBX6EnvZOmC9a3A7NHz3"
        ];
      };
    };
  };

  sops.secrets.rootpasswd = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };
  sops.secrets.komico-passwd = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };
}
