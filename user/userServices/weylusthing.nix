{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    user.services.weylusThing.enable =
      lib.mkEnableOption "tablet thing";
  };
  config = lib.mkIf config.user.services.weylusThing.enable {
    programs.weylus = {
      enable = true;
      openFirewall = true;
      users = ["komico"];
    };
  };
}
