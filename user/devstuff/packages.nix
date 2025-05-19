{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    user.devstuff.devpkgs.enable =
      lib.mkEnableOption "some dev pkgs";
  };

  config = lib.mkIf config.user.devstuff.devpkgs.enable {
    environment.systemPackages = with pkgs; [
      aspell # spelling for thing
      (aspellWithDicts (dicts:
        with dicts; [
          en
          en-computers
          en-science
        ]))
      clang # c compiler
      cmake # c maker or smth
      emacs-gtk # doom emacs notes and sometimes coding
      fd # fd
      gnumake # gnu maker
      libtool # tool
      lua-language-server # I love lua <3
      python3 # ew python...
      ripgrep # the better grep
      stow # for the dotfiles that I haven't set up yet...
      texliveFull # math, ew
      clang-tools # c comp. tools
      alejandra # nix formatter that I haven't set up LMAO
      sqlite # sql lite
      gcc # gnu c compiler
      busybox # bb (lsusb)
      fzf # fuzzy finder

    ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    programs.adb.enable = true;
  };
}
