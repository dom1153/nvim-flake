if vim.g.did_load_luasnip_plugin then
  return
end
vim.g.did_load_luasnip_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]

-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]

-- [[ SETUP ]]
require('luasnip.config').setup { enable_autosnippets = true }
-- assume it can find them in the rtp?
require('luasnip.loaders.from_vscode').lazy_load()
