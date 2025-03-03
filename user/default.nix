# things that MIGHT be cross platform, i don't actually know tho...
{ pkgs, lib, ... }: {

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./wmde 
    ./gaming 
    ./terminal
    ./devstuff
    ./packages.nix
    ./vms
  ];
}
