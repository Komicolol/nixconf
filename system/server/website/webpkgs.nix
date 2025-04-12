{ config, lib, pkgs, ... }:

{
  options = {
    webpkgs.enable =
      lib.mkEnableOption "just some web pkgs for a website that I hope you'll never see :D";
  };

  config = lib.mkIf config.webpkgs.enable {
    environment.systemPackages = with pkgs; [
      http-server
      nodejs
    ];
  };
}
