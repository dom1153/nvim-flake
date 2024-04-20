if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

-- [[ VIM OPTIONS ]]
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert' }

-- [[ DEFINES ]]
local telescope = require('telescope')

-- [[ HELPER FUNCTIONS ]]
local function fuzzy_grep(opts)
  builtin.grep_string(opts)
end

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>/', fuzzy_grep, { desc = ' Grep files' })

-- [[ SETUP ]]
telescope.setup {}
