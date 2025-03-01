# music...

{ pkgs, lib, config, ... }: {
  options = {
    jellything.enable =
      lib.mkEnableOption "enables music";
  };

  config = lib.mkIf config.music.enable {

  };
}
