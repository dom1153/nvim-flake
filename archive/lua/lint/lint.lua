if vim.g.did_load_lint_plugin then
  return
end
vim.g.did_load_lint_plugin = true

-- I have no idea how to use these

-- [[ DEFINES ]]
local lint = require('lint')

-- [[ VIM OPTIONS ]]
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    lint.try_lint()
  end,
})

-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]

-- [[ SETUP ]]
lint.linters_by_ft = {
  nix = { 'statix' },

  lua = { 'selene' }, -- designed for roblox?

  python = { 'flake8' },

  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },

  json = { 'jsonlint' },

  -- java = {"checkstyle"},
}
