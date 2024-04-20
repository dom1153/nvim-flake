if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

-- [[ DEFINES ]]
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- [[ HELPER FUNCTIONS ]]
local function fuzzy_grep(opts)
  opts = vim.tbl_extend('error', opts or {}, { search = '', prompt_title = 'Fuzzy grep' })
  builtin.grep_string(opts)
end

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>/', fuzzy_grep, { desc = ' Grep files' })

-- [[ TELESCOPE SETUP ]]
telescope.setup {}
