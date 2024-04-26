if vim.g.did_load_twilight_plugin then
  return
end
vim.g.did_load_twilight_plugin = true

-- it's cool but i wish I could just dim the highlighting...
-- (maybe this would requrie a fork)

-- [[ VIM OPTIONS (vim.opt) ]]
-- [[ DEFINES ]]
-- local = require('')
-- [[ LOCAL HELPER FUNCTIONS ]]
-- local project_files = function()

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>ut', '<cmd>Twilight<cr>', { desc = 'Toggle twilight' })

-- [[ SETUP ]]
require('twilight').setup({
  dimming = {
    alpha = 0.40,
  },
  context = 20,
})
