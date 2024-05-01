local cpp_ls_cmd = 'clangd'

-- Check if language server is available
if vim.fn.executable(cpp_ls_cmd) ~= 1 then
  return
end

-- [[ DEFINES ]]
local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

local ft_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { 'utf-8', 'utf-16' },
}

-- [[ LOCAL HELPER FUNCTIONS ]]
-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
-- nvim_lspconfig, but requires util functions
-- local goto_header_wrapper = function()
--   switch_source_header(0)
-- end

-- [[ KEYMAPS ]]
-- vim.keymap.set('n', '<leader>ch', goto_header_wrapper, { desc = 'Switch source/header' })

-- [[ START ]]
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
vim.lsp.start({
  name = 'clangd',
  cmd = { cpp_ls_cmd },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  -- root_dir = function(fname)
  --   return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
  -- end,
  single_file_support = true,
  capabilities = require('base.lsp').make_client_capabilities(ft_capabilities),
})
