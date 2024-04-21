if vim.g.did_load_auto_session_plugin then
  return
end
vim.g.did_load_auto_session_plugin = true

-- [[ VIM OPTIONS ]]
-- [[ DEFINES ]]
-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>qs', '<cmd>SessionSave<CR>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>qS', '<cmd>SessionSave<CR><cmd>qa<cr>', { desc = 'Save session and quit' })
vim.keymap.set('n', '<leader>qr', '<cmd>SessionRestore<CR>', { desc = 'Restore session' })
vim.keymap.set('n', '<leader>qd', '<cmd>SessionDelete<CR>', { desc = 'Delete Session (current)' })
vim.keymap.set('n', '<leader>qD', '<cmd>Autosession delete<CR>', { desc = 'Delete Session (UI)' })
vim.keymap.set('n', '<leader>qX', '<cmd>SessionPurgeOrphaned<CR>', { desc = 'Cleanup Oprhaned Sessions' })
vim.keymap.set('n', '<leader>qo', '<cmd>Autosession search<CR>', { desc = 'Open session (UI)' })

-- [[ SETUP ]]
-- vim.fn.stdpath('data').."/sessions/"
require('auto-session').setup({
  -- usage: manualy save only, auto restore
  log_level = 'error',
  auto_save_enabled = false,
  auto_session_create_enabled = false,

  cwd_change_handling = {
    restore_upcoming_session = false,
  },
})
