# music...

{ pkgs, lib, config, ... }: {
  options = {
    musicthingy.enable =
      lib.mkEnableOption "enables music";
  };

  config = lib.mkIf config.musicthingy.enable {
    services.mopidy = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      snapcast
    ];
  };
}
