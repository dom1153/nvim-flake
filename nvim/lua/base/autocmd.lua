-- [[ Basic Autocommands ]]
--   See `:help lua-guide-autocommands`

-- [[ DEFINES ]]
local augroup = vim.api.nvim_create_augroup
local dom1153_group = augroup('dom1153', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- [[ LOCAL HELPER FUNCTIONS ]]
local lsp_map_wrap = function(e, mode, key, fn, desc)
  local opts = { buffer = e.buf }
  if desc then
    opts = { buffer = e.buf, desc = desc }
  end
  return vim.keymap.set(mode, key, function()
    fn()
  end, opts)
end

-- [[ AUTOCMD(S) ]]

---- Highlight when yanking (copying) text
----   Try it with `yap` in normal mode
----   See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = yank_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('LspAttach', {
  group = dom1153_group,
  callback = function(e)
    lsp_map_wrap(e, 'n', 'gd', vim.lsp.buf.definition)
    lsp_map_wrap(e, 'n', 'K', vim.lsp.buf.hover)

    lsp_map_wrap(e, 'n', '<leader>cs', vim.lsp.buf.workspace_symbol, 'Workspace symbol')
    lsp_map_wrap(e, 'n', '<leader>cd', vim.diagnostic.open_float, 'Diagnostics open float (cursor)')
    lsp_map_wrap(e, 'n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    lsp_map_wrap(e, 'n', '<leader>cr', vim.lsp.buf.references, 'References')
    lsp_map_wrap(e, 'n', '<leader>cR', vim.lsp.buf.rename, 'Rename')

    lsp_map_wrap(e, 'i', '<C-h>', vim.lsp.buf.signature_help, 'Signature help')
    lsp_map_wrap(e, 'n', '[d', vim.diagnostic.goto_next, 'Goto next diagnostic')
    lsp_map_wrap(e, 'n', ']d', vim.diagnostic.goto_prev, 'Goto previous diagnostic')
  end,
})
