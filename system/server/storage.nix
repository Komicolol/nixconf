# yay, i love like 256gb of extra storage!!!

{ pkgs, lib, config, ... }: {
  options = {
    jellything.enable =
      lib.mkEnableOption "enables storage";
  };

  config = lib.mkIf config.storage.enable {

  };
}
