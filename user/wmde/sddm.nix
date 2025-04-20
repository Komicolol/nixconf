{
  config,
  lib,
  pkgs,
  ...
}: {
  # adding sddm here because why not :3
  options = {
    user.wmde.sddmDM.enable =
      lib.mkEnableOption "sddm thing.";
  };
  config = lib.mkIf config.user.wmde.sddmDM.enable {
    services.xserver.displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };

    environment.systemPackages = with pkgs; [
      catppuccin-sddm
    ];
  };
}
