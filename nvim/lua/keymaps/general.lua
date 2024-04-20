-- [[ UI CURSOR CONSISTENCY KEYMAPS ]]
-- Allow cursor to stay in the same place after J motion
vim.keymap.set('n', 'J', 'mzJ`z', { silent = true })

-- <c-d> and <c-u> keep cursor in middle
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })

-- Allow search terms to stay in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- [[ CLIPBOARD / REGISTER KEYMAPS ]]
-- clipboard and register management (paste seems to inherit clipboard by default)
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard (motion)' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to void register (motion)' })

-- puts the overwritten text to the void buffer (clipboard stays the same)
-- e.g. Allows you to highlight over text, paste over it with <leader>p, still keep clipboard
vim.keymap.set({ 'x', 'v' }, '<leader>p', [["_dP]])

-- [[ NOP KEYMAPS  ]]
-- normal Q repeats the last recorded register [count] times
vim.keymap.set('n', 'Q', '<nop>')

-- [[ CONVENIENCE KEYMAPS ]]
-- Esc -> <cmd>nohighlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- <C-c> instead of pressing esc (insert mode) just because
vim.keymap.set('i', '<C-c>', '<Esc>')

-- <C-s> save
vim.keymap.set({ 'i', 'n', 'x', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- qa/qq quit
vim.keymap.set('n', '<leader>qa', '<cmd>qa<cr>', { desc = 'Quit All' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- [[ BUFFER KEYMAPS ]]
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bX', '<cmd>%bdelete<cr>', { desc = 'Delete all buffer' })

-- [[ TAB KEYMAPS ]]
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>', { silent = true, desc = 'New Tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<cr>', { silent = true, desc = 'Close tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<cr>', { silent = true, desc = 'Next Tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<cr>', { silent = true, desc = 'Previous Tab' })

-- [[ WINDOW KEYMAPS ]]
-- Window Navigation (standard)
vim.keymap.set('n', '<leader>wh', '<C-W>h', { silent = true, desc = 'Go to window left' })
vim.keymap.set('n', '<leader>wj', '<C-W>j', { silent = true, desc = 'Go to window down' })
vim.keymap.set('n', '<leader>wk', '<C-W>k', { silent = true, desc = 'Go to window up' })
vim.keymap.set('n', '<leader>wl', '<C-W>l', { silent = true, desc = 'Go to window right' })

-- Window navigation (arrow keys)
vim.keymap.set('n', '<Left>', '<C-W>h', { silent = true, desc = 'Go to window left' })
vim.keymap.set('n', '<Down>', '<C-W>j', { silent = true, desc = 'Go to window down' })
vim.keymap.set('n', '<Up>', '<C-W>k', { silent = true, desc = 'Go to window up' })
vim.keymap.set('n', '<Right>', '<C-W>l', { silent = true, desc = 'Go to window right' })

-- Window navigation (A-hjkl)
vim.keymap.set('n', '<A-h>', '<C-W>h', { silent = true, desc = 'Go to window left' })
vim.keymap.set('n', '<A-j>', '<C-W>j', { silent = true, desc = 'Go to window down' })
vim.keymap.set('n', '<A-k>', '<C-W>k', { silent = true, desc = 'Go to window up' })
vim.keymap.set('n', '<A-l>', '<C-W>l', { silent = true, desc = 'Go to window right' })

-- Other navigation
vim.keymap.set('n', '<leader>ww', '<C-W>w', { silent = true, desc = 'Next windows' })
vim.keymap.set('n', '<leader>wx', '<C-W>x', { silent = true, desc = 'Swap current with next' })
vim.keymap.set('n', '<leader>wp', '<C-W>p', { silent = true, desc = 'Other window' })

-- Split Windows
vim.keymap.set('n', '<leader>ws', '<C-W>s', { silent = true, desc = 'Split window below' })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { silent = true, desc = 'Split window right' })

-- Close windows
vim.keymap.set('n', '<leader>wq', '<C-W>q', { silent = true, desc = 'Close current window' })
vim.keymap.set('n', '<leader>wo', '<C-W>o', { silent = true, desc = 'Close other window' })

-- Resize window (maximize, equalize)
vim.keymap.set('n', '<leader>w_', '<C-W>_', { silent = true, desc = 'Max out the height' })
vim.keymap.set('n', '<leader>w|', '<C-W>|', { silent = true, desc = 'Max out the width' })
vim.keymap.set('n', '<leader>w=', '<C-W>=', { silent = true, desc = 'Equally high and wide' })

-- [[ MISC KEYMAPS ]]
-- TODO: move to mini plugin
-- Mini.Hue
vim.keymap.set('n', '<leader>ur', '<cmd>colorscheme randomhue<cr>', { silent = true, desc = 'Theme Random' })
vim.keymap.set('n', '<leader>uR', '<cmd>colorscheme catppuccin<cr>', { silent = true, desc = 'Theme Catppuccin' })
