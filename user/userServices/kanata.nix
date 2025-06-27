{ config, lib, pkgs, ... }:

{
  options = { user.services.kanata.enable = lib.mkEnableOption "kanata keyboard thing"; };
  config = lib.mkIf config.user.services.kanata.enable {
    services.kanata = {
      # TODO: place ur kanta config here instead
      enable = true;
    };
  };
}
