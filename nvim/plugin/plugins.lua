if vim.g.did_load_plugins_plugin then
  return
end
vim.g.did_load_plugins_plugin = true

-- for plugins with very barebone setups
require('scrollview').setup {
  signs_on_startup = {},
}
