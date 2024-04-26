if vim.g.did_load_catppuccin_plugin then
  return
end
vim.g.did_load_catppuccin_plugin = true

-- [[ CATPPUCCIN ]]
-- See :help catppuccin-configuration for default options
require('catppuccin').setup({
  flavour = 'mocha',

  transparent_background = true, -- disables setting the background color.

  dim_inactive = { enabled = false }, -- may be useful if not using transparent background

  -- :help catppuccin-integrations
  -- for a short list, see personal catppuccin-ref.txt
  integrations = {
    cmp = true,
    gitsigns = true,
    harpoon = true,
    illuminate = { enabled = true, lsp = false },
    indent_blankline = { enabled = true, scope_color = 'lavender', colored_indent_levels = true },
    mini = { enabled = true, indentscope_color = '' },
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    which_key = true,

    native_lsp = {
      enabled = true,
      inlay_hints = { background = true },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        information = { 'underline' },
        warnings = { 'underline' },
      },
    },
  },
})

-- setup must be called before loading
vim.cmd.colorscheme('catppuccin')
