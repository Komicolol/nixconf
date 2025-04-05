{ config, lib, pkgs, ... }:

{
  options = {
    moneroYay.enable =
      lib.mkEnableOption "i mean it's just monero since i got nothing else to so lmao";
  };

  config = lib.mkiIf config.moneroYay.enable {
    services.monero.enable = true;
    # TODO: figure out how to start mining ig idk
  };
}
