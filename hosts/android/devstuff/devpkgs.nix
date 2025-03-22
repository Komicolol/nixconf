{ config, lib, pkgs, ... }:

{
  options = {
    devstuff.enable =
      lib.mkEnableOption "some dev pkgs";
  };

  config = lib.mkIf config.devstuff.enable {
    environment.packages = with pkgs; [
      clang
      cmake
      emacs30-pgtk
      fd
      gnumake
      libtool
      lua-language-server
      python3
      ripgrep
      stow
      texliveFull
    ];
  };
}
