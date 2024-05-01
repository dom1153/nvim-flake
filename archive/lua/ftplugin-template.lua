local ls_cmd = 'lua-language-server'

-- Check if language-server is available
if vim.fn.executable(ls_cmd) ~= 1 then
  return
end

-- [[ DEFINES ]]
local root_files = {
  '.luarc.json',
}

-- [[ LOCAL HELPER FUNCTIONS ]]
-- local function switch_source_header(bufnr)
-- end

-- [[ KEYMAPS ]]

-- [[ START ]]
vim.lsp.start({
  name = 'lua_ls',
  cmd = { ls_cmd },
  filetypes = { 'lua' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  -- root_dir = function(fname)
  --   return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
  -- end,
  single_file_support = true,
  capabilities = require('base.lsp').make_client_capabilities(),
  settings = {
    Lua = {},
  },
})
