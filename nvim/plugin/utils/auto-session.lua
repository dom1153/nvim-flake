if vim.g.did_load_auto_session_plugin then
  return
end
vim.g.did_load_auto_session_plugin = true

-- [[ VIM OPTIONS ]]
-- [[ DEFINES ]]
-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>qs', '<cmd>SessionSave<CR>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>qr', '<cmd>SessionRestore<CR>', { desc = 'Restore session' })
vim.keymap.set('n', '<leader>qd', '<cmd>SessionDelete<CR>', { desc = 'Delete Session (current)' })
vim.keymap.set('n', '<leader>qD', '<cmd>Autosession delete<CR>', { desc = 'Delete Session (UI)' })
vim.keymap.set('n', '<leader>qX', '<cmd>SessionPurgeOrphaned<CR>', { desc = 'Cleanup Oprhaned Sessions' })
vim.keymap.set('n', '<leader>qo', '<cmd>Autosession search<CR>', { desc = 'Open session (UI)' })

-- [[ SETUP ]]
require('auto-session').setup {
  log_level = 'error',

  cwd_change_handling = {
    restore_upcoming_session = true,
  },
}
