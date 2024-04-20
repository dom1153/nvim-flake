if vim.g.did_load_which_key_plugin then
  return
end
vim.g.did_load_which_key_plugin = true

-- timeoutlen for which-key
vim.o.timeoutlen = 10

local which_key = require('which-key')

-- :help which-key.nvim-which-key-configuration
which_key.setup {
  icons = {
    separator = '-',
    group = '', -- using custom per-group icons
  },
  disable = {
    filetypes = {
      'TelescopePrompt',
    },
  },
}

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
}, { prefix = '<leader>' })
