---- Maximize help
vim.cmd([[
  augroup filetype_help
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | wincmd _ | endif
  augroup END
]])

-- Go to the position I was when last editing the file?
vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif]])

-- :help -> :tab help
vim.cmd([[cabbrev help tab help]])
