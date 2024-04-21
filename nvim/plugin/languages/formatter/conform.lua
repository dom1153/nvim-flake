if vim.g.did_load_conform_plugin then
  return
end
vim.g.did_load_conform_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]

-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]

-- [[ SETUP ]]
require('conform').setup {
  timeout_ms = 500,
  lsp_fallback = true,

  notify_on_error = true,
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
  formatters = {
    -- yamlfix env untested
    yamlfix = {
      env = {
        YAMLFIX_SECTION_WHITELINES = '1',
      },
    },
    yamlfmt = {
      -- https://github.com/google/yamlfmt/blob/main/docs/config-file.md--basic-formatter
      prepend_args = { '-formatter', 'retain_line_breaks_single=true,include_document_start=true' },
    },
  },
  formatters_by_ft = {
    lua = { 'stylua' },

    -- Conform will run multiple formatters sequentially
    python = { 'isort', 'black' },

    -- Use a sub-list to run only the first available formatter
    javascript = { { 'prettierd', 'prettier' } },
    javascriptreact = { { 'prettierd', 'prettier' } },
    typescript = { { 'prettierd', 'prettier' } },
    typescriptreact = { { 'prettierd', 'prettier' } },

    html = { { 'prettierd', 'prettier' } },
    css = { { 'prettierd', 'prettier' } },

    nix = { 'alejandra' },

    markdown = { { 'prettierd', 'prettier' } },

    rust = { 'rustfmt' },

    java = { 'google-java-format' },

    fish = { 'fish_indent' },

    sh = { 'shfmt' },
    -- zsh = ["shfmt"],

    json = { { 'fixjson', 'deno_fmt' } },
    jsonc = { 'deno_fmt' }, --## fixjson will delete comments

    yaml = { { 'yamlfmt' } },

    --## c/cpp seem to be covered by lsp or something

    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ['_'] = { 'trim_whitespace' },
  },
}
