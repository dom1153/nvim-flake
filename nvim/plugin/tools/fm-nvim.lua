if vim.g.did_load_fm_nvim_plugin then
  return
end
vim.g.did_load_fm_nvim_plugin = true

-- [[ VIM OPTIONS ]]
-- [[ DEFINES ]]
-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]
-- vim.keymap.set('n', '<leader>e', '<cmd>Lf ' .. vim.fn.expand('%:p:h') .. '<CR>', { desc = 'File Explorer (lf)' })
-- VVV janky, but it'll do
vim.keymap.set('n', '<leader>e', '<cmd>Lf ' .. '%:p:h' .. '<CR>', { desc = 'File Explorer (lf)' })

-- [[ SETUP ]]
require('fm-nvim').setup({
  ui = { float = { border = 'single' } },
  -- Todo: is there a way to tell LF to open the vim command? (read plugin source)
  -- e.g. set an environment variable
  mappings = {
    vert_split = '<C-v>',
    horz_split = '<C-h>',
    tabedit = 't',
    edit = 'e',
    ESC = '<ESC>',
  },
})
