if vim.g.did_load_zen_mode_plugin then
  return
end
vim.g.did_load_zen_mode_plugin = true

-- [[ VIM OPTIONS (vim.opt) ]]
-- [[ DEFINES ]]
-- local = require('')
-- [[ LOCAL HELPER FUNCTIONS ]]
-- local project_files = function()

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>', { desc = ' ZenMode' })
vim.keymap.set('n', '<A-f>', '<cmd>ZenMode<cr>', { desc = ' ZenMode' })

-- [[ SETUP ]]
-- :h zen-mode.nvim-zen-mode-configuration
require('zen-mode').setup({
  window = {
    width = 100,
  },
  options = {
    signcolumn = 'yes', -- disable signcolumn
    number = true,
    relativenumber = true,
    list = true,
  },
  plugins = {
    options = {
      laststatus = 3,
    },
    gitsigns = { enabled = true },
    wezterm = {
      enabled = true,
    },
  },
})
