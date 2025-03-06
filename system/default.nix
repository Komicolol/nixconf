{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./net
    ./audio
    ./fonts
    ./users
    ./services
    ./bluetooth
    ./server
  ];

  time.timeZone = "Australia/Perth";

  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };
  # Making nh work or smth idk man i'm tired af
  environment.sessionVariables = {
    FLAKE = "/home/komico/nixconf";
  };
}
