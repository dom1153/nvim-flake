if vim.g.did_load_mini_plugin then
  return
end
vim.g.did_load_mini_plugin = true

-- [[ HELPER FUNCTIONS ]]
local function mini_files_current_buffer()
  local minifiles = require('mini.files')
  -- TODO: check if this file exists, otherwise open nearest directory?
  minifiles.open(vim.api.nvim_buf_get_name(0))
  minifiles.reveal_cwd()
end

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>e', mini_files_current_buffer, { desc = 'File Explorer' })

-- [[ MODULES ]]
-- MiniFiles.config
require('mini.files').setup({
  mappings = {
    show_help = '<leader>?',
  },
  options = {
    -- :echo stdpath('data') to see its path
    -- Which should be ~/.local/share/nvim/mini.files/trash
    permanent_delete = false,
  },
  windows = {
    preview = true,
    -- the one with the cursor
    width_focus = 40,
    -- all the other windows (that don't have the cursor on them)
    width_nofocus = 40,
    width_preview = 40,
  },
})

-- mini buffer alternate keymaps
vim.api.nvim_command([[
autocmd FileType minifiles nnoremap <buffer><silent><esc> <cmd>lua MiniFiles.close()<CR>
autocmd FileType minifiles nnoremap <buffer><silent>? <cmd>lua MiniFiles.show_help()<CR>
autocmd FileType minifiles-help nnoremap <buffer><silent><esc> <cmd>q<CR>
]])

require('mini.cursorword').setup({})

-- select mru buffer when deleting a buffer
require('mini.bufremove').setup({})
