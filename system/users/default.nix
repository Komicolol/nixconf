{ config, lib, pkgs, ... }:

{
  users = {
    users = {
      komico = {
        isNormalUser = true;
        description = "komico";
        extraGroups = [ "networkmanager" "wheel" "input" "uinput" "docker" ];
        openssh.authorizedKeys.keys = [
          # if you are gonna use this config (dont.), probably change this.
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINe7nKpSZT4fTO1sJoJLGhRJVBX6EnvZOmC9a3A7NHz3"
        ];
      };
    };
  };
}
