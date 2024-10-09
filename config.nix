{ pkgs, unstable, plugin }: {
  # binaries that should be added to neovims PATH
  extraPackages = with pkgs; [
    # utilities
    git
    tree-sitter

    fzf
    ripgrep
    fd

    # language servers
    # deno # broken
    nil # nix
    nodePackages.bash-language-server
    dockerfile-language-server-nodejs
    gopls
    golangci-lint-langserver
    golangci-lint
    marksman
    pyright
    rust-analyzer
    typescript-language-server
    typescript

    # debugger
    delve
  ];

  # plugins loaded at start
  startPlugins = with pkgs.vimPlugins; [
    which-key-nvim
    nvim-lspconfig

    # completion
    nvim-cmp
    cmp-nvim-lsp
    cmp-path
    cmp-git
    lsp_signature-nvim

    # snippets are needed for many language servers
    cmp-vsnip
    vim-vsnip
    friendly-snippets # snippet collection for all languages

    # syntax highlighting
    nvim-treesitter.withAllGrammars
    nvim-treesitter-context
    nvim-lint
    delimitMate # auto bracket
    vim-illuminate # highlight other words under cursor

    # utilities
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
    nvim-web-devicons

    # navigation
    hop-nvim
    leap-nvim
    nvim-tree-lua

    # highlights current variable with underline
    nvim-cursorline

    # bars
    lualine-nvim
    bufferline-nvim

    # fzf
    fzf-lua

    nvim-colorizer-lua
    vim-fugitive

    # debugger
    nvim-dap

    # colorschemes
    kanagawa-nvim
  ];

  # plugins loaded optionally
  optPlugins = [ ];

  neovimConfig = with pkgs.lib.strings; builtins.concatStringsSep "\n" [
    (fileContents ./base.vim)
    (fileContents ./theme.vim)
    (fileContents ./plugins.vim)
    ''
      lua << EOF
      ${fileContents ./utils.lua}
      ${fileContents ./plugins.lua}
      ${fileContents ./lsp.lua}
      ${fileContents ./debug.lua}
      ${fileContents ./theme.lua}
      EOF
    ''
  ];
}
