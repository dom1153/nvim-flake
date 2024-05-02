# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix {};

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = with pkgs.vimPlugins; [
    # plugins from nixpkgs go in here.
    # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins
    nvim-treesitter.withAllGrammars
    luasnip # snippets | https://github.com/l3mon4d3/luasnip/
    friendly-snippets

    # nvim-cmp (autocompletion) and extensions
    nvim-cmp # https://github.com/hrsh7th/nvim-cmp
    cmp_luasnip # snippets autocompletion extension for nvim-cmp | https://github.com/saadparwaiz1/cmp_luasnip/
    lspkind-nvim # vscode-like LSP pictograms | https://github.com/onsails/lspkind.nvim/
    cmp-nvim-lsp # LSP as completion source | https://github.com/hrsh7th/cmp-nvim-lsp/
    cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
    cmp-buffer # current buffer as completion source | https://github.com/hrsh7th/cmp-buffer/
    cmp-path # file paths as completion source | https://github.com/hrsh7th/cmp-path/
    cmp-nvim-lua # neovim lua API as completion source | https://github.com/hrsh7th/cmp-nvim-lua/
    cmp-cmdline # cmp command line suggestions
    cmp-cmdline-history # cmp command line history suggestions
    # ^ nvim-cmp extensions

    # git integration plugins
    gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
    lazygit-nvim

    # telescope and extensions
    telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
    telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim/

    mini-nvim # https://github.com/echasnovski/mini.nvim/
    # telescope-smart-history-nvim # https://github.com/nvim-telescope/telescope-smart-history.nvim

    # UI
    lualine-nvim # Status line | https://github.com/nvim-lualine/lualine.nvim/
    # nvim-navic # Add LSP location to lualine | https://github.com/SmiteshP/nvim-navic
    statuscol-nvim # Status column | https://github.com/luukvbaal/statuscol.nvim/
    nvim-treesitter-context # nvim-treesitter-context
    which-key-nvim
    nvim-scrollview
    tint-nvim
    # vim-illuminate -> follows lsp? nah ; also does NOT require setup call

    # language support

    # navigation/editing enhancement plugins
    vim-unimpaired # predefined ] and [ navigation keymaps | https://github.com/tpope/vim-unimpaired/
    # eyeliner-nvim # Highlights unique characters for f/F and t/T motions | https://github.com/jinh0/eyeliner.nvim
    nvim-surround # https://github.com/kylechui/nvim-surround/
    nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
    nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/

    # Useful utilities
    nvim-unception # Prevent nested neovim sessions | nvim-unception

    # libraries that other plugins depend on
    sqlite-lua
    plenary-nvim
    nvim-web-devicons
    vim-repeat
    popup-nvim
    nui-nvim

    # dump
    nvim-lint
    conform-nvim
    toggleterm-nvim
    catppuccin-nvim # https://github.com/catppuccin/nvim
    leap-nvim
    comment-nvim
    harpoon
    auto-session
    cheatsheet-nvim ### depends on plenary, popup
    telescope-undo-nvim
    obsidian-nvim
    zen-mode-nvim
    twilight-nvim
    indent-blankline-nvim
    vim-sleuth
    nvim-lspconfig
    vim-startuptime

    # bleeding-edge plugins from flake inputs
    (mkNvimPlugin inputs.toggletasks "toggletasks")
    (mkNvimPlugin inputs.telescope-emoji "telescope-emoji")
    (mkNvimPlugin inputs.telescope-glyph "telescope-glyph")
    (mkNvimPlugin inputs.scribe-nvim "scribe") # depends on nui-nvim and telescope
    # (mkNvimPlugin inputs.wf-nvim "wf.nvim") # (example) keymap hints | https://github.com/Cassin01/wf.nvim
  ];

  extraPackages = with pkgs; [
    # language servers, etc.
    lua-language-server
    nil # nix LSP
    clangStdenv # cpp
    lazygit
    rust-analyzer # rust

    # formatters
    stylua ### lua | An opinionated Lua code formatter
    isort ### python | A Python utility / library to sort Python imports
    black ### python |  The uncompromising Python code formatter
    prettierd ### js |  Prettier, as a daemon
    nodePackages.prettier ### js | Prettier is an opinionated code formatter
    alejandra ### nix | The Uncompromising Nix Code Formatter
    rustfmt ### rust | A tool for formatting Rust code according to style guidelines
    google-java-format ### java |  zifter-google-java-format
    fish ### fish
    shfmt ### bash / sh
    # shellharden ### bash formatting -> quotes too mnay things (e.g. lists...)
    deno ### json
    nodePackages.fixjson ### json
    yamlfmt ### yaml | google
    # python311Packages.yamlfix ### opinionated; issues installing on darwin (pip)

    # linters
    statix # nix
    selene # lua
    # python312.flake8 # python
    # eslint_d # js / ts
    # nodePackages.jsonLint # json
    # checkstyle #java
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
