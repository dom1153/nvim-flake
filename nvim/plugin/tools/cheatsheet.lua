if vim.g.did_load_cheatsheet_plugin then
  return
end
vim.g.did_load_cheatsheet_plugin = true

-- [[ VIM OPTIONS ]]
-- [[ DEFINES ]]
-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>P', '<cmd>Cheatsheet<CR>', { desc = 'Cheatsheet' })
-- vim.keymap.set('n', '<leader>?', '<nop>')

-- [[ SETUP ]]
require('cheatsheet').setup({
  bundled_cheatsheets = false,
  bundled_plugin_cheatsheets = true,
  include_only_installed_plugins = true,

  -- Key mappings bound inside the cheatsheet window
  cheatsheet_mappings = {
    ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
    ['<A-CR>'] = '<nop>',
    ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
    ['<C-E>'] = '<nop>',
  },
})
