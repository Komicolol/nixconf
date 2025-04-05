{ config, lib, pkgs, ... }:

{
  options = {
    weylusThing.enable =
      lib.mkEnableOption "tablet thing";
  };
  config = lib.mkIf config.weylusThing.enable {
    programs.weylus = {
      enable = true;
      openFirewall = true;
      users = [ "komico" ];
    };
  };
}
