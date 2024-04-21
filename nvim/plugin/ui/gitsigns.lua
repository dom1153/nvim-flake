if vim.g.did_load_gitsigns_plugin then
  return
end
vim.g.did_load_gitsigns_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]

-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>D', '<cmd>Gitsigns diffthis<cr>', { desc = 'Git diff this file' })
vim.keymap.set('n', '<leader>b', '<cmd>Gitsigns blame_line<cr>', { desc = 'Git blame on cursor' })

-- [[ SETUP ]]
require('gitsigns').setup {}
