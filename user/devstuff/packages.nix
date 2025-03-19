{ config, lib, pkgs, ... }:

{
  options = {
    devstuff.enable =
      lib.mkEnableOption "some dev pkgs";
  };

  config = lib.mkIf config.devstuff.enable {
    environment.systemPackages = with pkgs; [
      aspell
      (aspellWithDicts (dicts: with dicts; [
        en
        en-computers
        en-science
      ]))
      clang
      cmake
      emacs30
      fd
      gnumake
      libtool
      lua-language-server
      python3
      ripgrep
      stow
      texliveFull
    ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

}
