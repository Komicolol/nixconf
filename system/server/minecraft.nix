# I FUCKING LOVE MINECRAFTTT

{ pkgs, lib, config, ... }: {
  options = {
    jellything.enable =
      lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.minecraft.enable {

  };
}
