{ config, lib, pkgs, ... }:

{
  users = {
    users = {
      komico = {
        isNormalUser = true;
        description = "komico";
        extraGroups = [ "networkmanager" "wheel" "input" "uinput" ];
      };
    };
  };
}
