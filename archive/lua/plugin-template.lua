if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

-- [[ VIM OPTIONS (vim.opt) ]]
-- [[ DEFINES ]]
-- local = require('')
-- [[ LOCAL HELPER FUNCTIONS ]]
-- local project_files = function()

-- [[ KEYMAPS ]]
-- vim.keymap.set('n', '<map>', 'function', { desc = ' Grep files' })

-- [[ SETUP ]]
require('').setup({})
