-- [[ Basic Autocommands ]]
--   See `:help lua-guide-autocommands`

---- Highlight when yanking (copying) text
----   Try it with `yap` in normal mode
----   See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

---- Maximize help
vim.cmd([[
  augroup filetype_help
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | wincmd _ | endif
  augroup END
]])

---- Go to the position I was when last editing the file
-- vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif]])

---- :help -> :tab help
-- vim.cmd([[cabbrev help tab help]])
