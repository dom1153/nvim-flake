if vim.g.did_load_gitsigns_plugin then
  return
end
vim.g.did_load_gitsigns_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]

-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>gD', '<cmd>Gitsigns diffthis<cr>', { desc = 'Git diff this file' })
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<cr>', { desc = 'Git blame (cursor)' })

-- [[ SETUP ]]
require('gitsigns').setup({})
