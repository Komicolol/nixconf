{ config, lib, pkgs, ... }:

{
  options = {
    server.webstuff.webpkgs.enable =
      lib.mkEnableOption "just some web pkgs for a website that I hope you'll never see :D";
  };

  config = lib.mkIf config.server.webstuff.webpkgs.enable {
    environment.systemPackages = with pkgs; [
      http-server
      nodejs
    ];
  };
}
