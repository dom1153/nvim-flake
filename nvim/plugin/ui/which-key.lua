if vim.g.did_load_which_key_plugin then
  return
end
vim.g.did_load_which_key_plugin = true

-- [[ VIM OPTIONS ]]
vim.o.timeoutlen = 10

-- [[ DEFINES ]]
local which_key = require('which-key')

-- [[ SETUP ]]

-- :help which-key.nvim-which-key-configuration
which_key.setup({
  icons = {
    separator = '-',
    group = '', -- using custom per-group icons
  },
  disable = {
    filetypes = {
      'TelescopePrompt',
    },
  },
})

-- [[ KEYMAPS ]]
-- :help which-key.nvim-which-key-setup
local spacing = '  '
which_key.register({
  -- basic config
  t = { name = '' .. spacing .. 'Tab' },
  w = { name = '' .. spacing .. 'Window' },
  b = { name = '󰓩' .. spacing .. 'Buffer' },

  -- toggles and more
  u = { name = '󰃣' .. spacing .. 'UI/UX' },

  -- telescope
  f = { name = '󰈞' .. spacing .. 'Find' },
  v = { name = '' .. spacing .. 'Vim' },

  -- git
  g = { name = '' .. spacing .. 'Git' },

  -- noice notifications
  n = { name = '󱅫' .. spacing .. 'Notifications' },

  -- toggleterm
  T = { name = '' .. spacing .. 'Terminal' },

  -- session (wip)
  q = { name = '' .. spacing .. 'Quit/session' },

  -- code
  c = { name = '󰅬' .. spacing .. 'code' },

  -- harpoon
  -- h = { name = '󰈺' .. spacing .. 'Harpoon' },

  -- filetype utilties
  j = { name = '' .. spacing .. 'Filetype' },

  -- obsidian
  k = { name = '' .. spacing .. 'Obsidian' },

  -- scribe
  s = { name = '' .. spacing .. 'Scratch' },

  -- ignore default binding for cheatsheet.nivm
  ['?'] = { '<nop>', 'which_key_ignore' },
}, { prefix = '<leader>' })
