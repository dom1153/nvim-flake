if vim.g.did_load_lsp_plugin then
  return
end
vim.g.did_load_lsp_plugin = true

-- general lsp *should be working via ftplugins

-- [[ GENERAL LSP CONFIG ]]
local _border = 'rounded'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = _border,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = _border,
})

-- vim.diagnostic.config {
--   float = { border = _border },
--
--   -- https://stackoverflow.com/questions/69290794/nvim-lsp-change-lspconfig-diagnostic-message-location
--   -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
--   virtual_text = false,
--   signs = true,
--   underline = false,
--   update_in_insert = true,
--   severity_sort = false,
-- }

-- VVV dependant on navic?
-- require('lspconfig.ui.windows').default_options = {
--   border = _border,
-- }
