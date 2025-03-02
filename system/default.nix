{ config, lib, pkgs, ... }:

{
  imports = [
    # ./net
    ./audio
    ./fonts
    # ./users
    ./services
    ./bluetooth
  ];
}
