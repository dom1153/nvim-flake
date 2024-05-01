if vim.g.did_load_scribe_plugin then
  return
end
vim.g.did_load_scribe_plugin = true

-- [[ VIM OPTIONS (vim.opt) ]]
-- [[ DEFINES ]]
-- local = require('')

-- [[ LOCAL HELPER FUNCTIONS ]]
local scribe_zettelkasten = function()
  vim.cmd('ScribeOpen' .. ' ' .. os.date('%Y%m%d%H%M', os.time()))
end

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>fs', '<cmd>ScribeFind<cr>', { desc = ' Search scratch' })
vim.keymap.set('n', '<leader>s', scribe_zettelkasten, { desc = 'New scratch file' })
-- vim.keymap.set('n', '<leader>ss', '<cmd>ScribeOpen<cr>', { desc = 'Open scratch.txt' })

-- [[ SETUP ]]
require('scribe').setup({
  directory = '~/tmp/notes/',
  file_ext = '.txt',
  default_file = 'scratch',
})
