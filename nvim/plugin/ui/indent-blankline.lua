if vim.g.did_load_indent_blankline_plugin then
  return
end
vim.g.did_load_indent_blankline_plugin = true

-- not super useful if indentlines are set to 2 lines, where it's very dense

-- [[ VIM OPTIONS (vim.opt) ]]
-- [[ DEFINES ]]
-- local = require('')
-- [[ LOCAL HELPER FUNCTIONS ]]
-- local project_files = function()

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>ui', '<cmd>IBLToggle<cr>', { desc = 'Toggle indent-blanklines' })

-- [[ SETUP ]]
require('ibl').setup({
  enabled = false,
  scope = { enabled = false },
})
