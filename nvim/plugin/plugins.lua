if vim.g.did_load_plugins_plugin then
  return
end
vim.g.did_load_plugins_plugin = true

-- [[ BASIC SETUP CALL(S) ]]
-- lazygit
vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<CR>', { desc = 'LazyGit (root)' })

require('illuminate')

-- :h leap-custom-mappings
-- rebinds s, S, gs (main) and x (visual/motion only)
require('leap').create_default_mappings()

-- https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua
-- :h nvim-surround.configuration for individual categories
require('nvim-surround').setup {}

require('scrollview').setup {
  signs_on_startup = {},
}

-- Comment
-- https://github.com/numtostr/comment.nvim/?tab=readme-ov-file#configuration-optional
-- :h comment.config
require('Comment').setup {}
-- :h comment.ft
local ft = require('Comment.ft')
ft.kdl = { '//%s', '/*%s*/' }
