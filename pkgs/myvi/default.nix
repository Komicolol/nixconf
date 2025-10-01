{pkgs, lib, ...}: let
  leconf = pkgs.neovimUtils.makeNeovimConfig {
    withPython = false;
    withRuby = false;
    withNodejs = false;
    customRC = ''
      :luafile ${./init.lua}
    '';
    plugins = with pkgs.vimPlugins; [
      onedarkpro-nvim
      nvim-web-devicons
      fzf-lua
      orgmode
      org-roam-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-path
      cmp-cmdline
      cmp-buffer
      cmp-nvim-lsp
      nvim-treesitter.withAllGrammars
      which-key-nvim
      nvim-autopairs
      barbar-nvim
      luasnip
    ]; 
  };
in 
  pkgs.symlinkJoin {
    name = "myvi";
    paths = [(pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped leconf)]
    ++ [
      pkgs.clang-tools
      pkgs.pyright
      pkgs.nixd
      pkgs.ripgrep
    ];
    postBuild = ''
    mv $out/bin/nvim $out/bin/myvi
    '';
  }


