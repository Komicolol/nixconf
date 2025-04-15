{ config, lib, pkgs, ... }:

{
  options = {
    user.devstuff.devpkgs.enable =
      lib.mkEnableOption "some dev pkgs";
  };

  config = lib.mkIf config.user.devstuff.devpkgs.enable {
    environment.systemPackages = with pkgs; [
      aspell
      (aspellWithDicts (dicts: with dicts; [
        en
        en-computers
        en-science
      ]))
      clang
      cmake
      emacs-gtk
      fd
      gnumake
      libtool
      lua-language-server
      python3
      ripgrep
      stow
      texliveFull
      clang-tools
      alejandra
      sqlite
      gcc
    ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

}
