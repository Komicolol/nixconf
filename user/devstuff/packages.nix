{
  config,
  lib,
  pkgs,
  outputs,
  ...
}: {
  options = {
    user.devstuff.devpkgs.enable =
      lib.mkEnableOption "some dev pkgs";
  };

  config = lib.mkIf config.user.devstuff.devpkgs.enable {
    environment.systemPackages = with pkgs;
      [
        aspell # spelling for thing
        (aspellWithDicts (dicts:
          with dicts; [
            en
            en-computers
            en-science
          ]))
        clang # c compiler
        cmake # c maker or smth
        emacs-pgtk # doom emacs notes and sometimes coding
        emacsPackages.sqlite3 # ARE YOU FUCKING KIDDING ME LMAOO
        fd # fd
        gnumake # gnu maker
        libtool # tool
        lua-language-server # I love lua <3
        python3 # ew python...
        ripgrep # the better grep
        stow # for the dotfiles that I HAVE set up!
        texliveFull # math, ew
        clang-tools # c comp. tools
        alejandra # nix formatter that I haven't set up LMAO
        sqlite # sql lite
        gcc # gnu c compiler
        busybox # bb (lsusb)
        tree-sitter-grammars.tree-sitter-typst # typst, because why not :3
        libtree # tree lib
        pandoc # org to pdf, md, mdx, wtvr
        acpi # something, that's for sure! (using it to look at bat. percentage rn)
        man-pages # learning c right now, and it seems pretty useful no???
        typst # yay!!!
        wordnet # dictionary !!
        sox # ... sounds...
        nixd # nix run nixpkgs#nix run nixpkgs#nix run nixpkgs#...
      ]
      ++ [
        outputs.packages.${system}.myvi # personal neovim conf, needs output thingy
      ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    programs.adb.enable = true;
    programs.nix-ld.enable = true;
  };
}
