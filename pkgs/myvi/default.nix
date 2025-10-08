{
  pkgs,
  lib,
  ...
}: let
  leconf = pkgs.neovimUtils.makeNeovimConfig {
    withPython = false;
    withRuby = false;
    withNodejs = false;
    customRC = ''
      :luafile ${./init.lua}
    '';
    plugins = with pkgs.vimPlugins; [
      # --- themes --- 
      onedarkpro-nvim
      # kanagawa-nvim
      # everforest
      # theming   
      nvim-web-devicons
      barbar-nvim
      alpha-nvim
      # --- if i ever stop using emacs, or if i want to write notes on the go --- 
      orgmode
      org-roam-nvim
      # --- useful stuff ---
      luasnip
      fzf-lua
      which-key-nvim
      nvim-autopairs
      # --- lsp + completion ---
      nvim-lspconfig
      nvim-cmp
      cmp-path
      cmp-cmdline
      cmp-buffer
      cmp-nvim-lsp
      # --- :TSInstall ---
      nvim-treesitter.withAllGrammars
    ];
  };
in
  pkgs.symlinkJoin {
    name = "myvi";
    paths =
      [(pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped leconf)]
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
