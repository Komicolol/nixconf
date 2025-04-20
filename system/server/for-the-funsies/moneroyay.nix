{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    server.for-the-funsies.moneroYay.enable =
      lib.mkEnableOption "i mean it's just monero since i got nothing else to so lmao";
  };

  config = lib.mkIf config.server.for-the-funsies.moneroYay.enable {
    services.monero.enable = true;
    # TODO: figure out how to start mining ig idk
  };
}
