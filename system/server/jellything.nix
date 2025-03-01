# definately legal shows :3

{ pkgs, lib, config, ... }: {
  options = {
    jellything.enable =
      lib.mkEnableOption "enables jellying";
  };

  config = lib.mkIf config.jellything.enable {

  };
}
