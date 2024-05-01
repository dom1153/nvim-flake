-- [[ Basic Autocommands ]]
--   See `:help lua-guide-autocommands`

-- [[ DEFINES ]]
-- local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})

-- [[ LOCAL HELPER FUNCTIONS ]]

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
