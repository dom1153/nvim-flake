if vim.g.did_load_harpoon_plugin then
  return
end
vim.g.did_load_harpoon_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]
local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

-- [[ HELPER FUNCTIONS ]]
-- a bit silly, but easier to edit later
local function nav_file_wrapper(num)
  return function()
    ui.nav_file(num)
  end
end

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = 'Add' })
vim.keymap.set('n', '<leader>he', ui.toggle_quick_menu, { desc = 'Quick Menu' })

vim.keymap.set('n', '<leader>hh', nav_file_wrapper(1), { desc = 'Go 1' })
vim.keymap.set('n', '<leader>hj', nav_file_wrapper(2), { desc = 'Go 2' })
vim.keymap.set('n', '<leader>hk', nav_file_wrapper(3), { desc = 'Go 3' })
vim.keymap.set('n', '<leader>hl', nav_file_wrapper(4), { desc = 'Go 4' })

vim.keymap.set('n', '<C-h>', nav_file_wrapper(1), { desc = 'Go 1' })
vim.keymap.set('n', '<C-j>', nav_file_wrapper(2), { desc = 'Go 2' })
vim.keymap.set('n', '<C-k>', nav_file_wrapper(3), { desc = 'Go 3' })
vim.keymap.set('n', '<C-l>', nav_file_wrapper(4), { desc = 'Go 4' })

-- https://stackoverflow.com/questions/21738018/vim-how-do-i-map-number-keys
-- Can't map CTRL-<num> due to portability :(

-- [[ SETUP ]]
require('harpoon').setup {}
