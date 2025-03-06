{ config, lib, pkgs, ... }:

{
  options = {
    syspkgs.enable =
      lib.mkEnableOption "syspkgs, might overwrite some user pkgs";
  };

  config = lib.mkIf config.syspkgs.enable {
    environment.systemPackages = with pkgs; [
      tmux
      btop
    ];
  };
}
