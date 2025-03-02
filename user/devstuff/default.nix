{ config, lib, pkgs, ... }:

{
  options = {
    devstuff.enable =
      lib.mkEnableOption "enables ur shit";
  };

  config = lib.mkIf config.devstuff.enable {
    environment.systemPackages = with pkgs; [
      stow
      ripgrep
      lua-language-server
      python3
      fd
      clang
      aspell
      (aspellWithDicts (dicts: with dicts; [
        en
        en-computers
        en-science
      ]))
      kanata
      cmake
      texliveFull
      gnumake
      libtool
      emacs29-pgtk
    ];

  };

}
