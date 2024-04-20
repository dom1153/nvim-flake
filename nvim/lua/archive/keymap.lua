local nmap = function(keys, func, des)
  vim.keymap.set('n', keys, func, { desc = des })
end

-- visual mode drag
-- Cool hat trick, but I like J in visual mode (:join works as an alternative)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move up when line is highlighted' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move down when line is highlighted' })

-- we got C-6 , no need for this
vim.keymap.set('n', '<leader>bo', '<cmd>e #<cr>', { desc = 'Switch Other Buffer' })
