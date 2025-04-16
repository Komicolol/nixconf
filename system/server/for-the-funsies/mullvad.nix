{ config, lib, pkgs, ... }:

{
  options.server.for-the-funsies.mullvad.enable = lib.mkEnableOption "mullvad vpn";
  config = lib.mkIf config.server.for-the-funsies.mullvad.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
