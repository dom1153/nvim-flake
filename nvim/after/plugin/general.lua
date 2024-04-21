-- sourced after general plugins is sourced
-- can debug with :5verbose set fo?
-- https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
-- https://stackoverflow.com/questions/16030639/vim-formatoptions-or/23326474#23326474
vim.cmd([[autocmd BufNewFile,BufRead * setlocal formatoptions-=cro]])
