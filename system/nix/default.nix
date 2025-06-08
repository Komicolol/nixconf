{ config, lib, pkgs, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/komico/nixconf";
  };
  # enable flakes you doofus
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # damn you Stallman!!
  nixpkgs.config.allowUnfree = true;

  # some editing if everything goes to shit..
  environment.systemPackages = with pkgs; [
    neovim
    git # git fetch bitches
    wget # do you use this?
  ];
}
