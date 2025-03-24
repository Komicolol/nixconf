{ config, lib, pkgs, ... }:

{
  options = {
    aiTypeShii.enable =
      lib.mkEnableOption "ollama and other things :3";
  };
  config = lib.mkIf config.aiTypeShii.enable {
    services.ollama = {
      enable = true;
      openFirewall = true;
      # get like an actual server tho LMAO
      acceleration = false;
    };

    services.open-webui = {
      enable = true;
      openFirewall = true;
    };
    environment.systemPackages = with pkgs; [
      oterm
      open-webui
    ];
  };
}
