if vim.g.did_load_lspconfig_plugin then
  return
end
vim.g.did_load_lspconfig_plugin = true

-- [[ VIM OPTIONS (vim.opt) ]]
-- [[ DEFINES ]]
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local dom1153_group = augroup('dom1153', {})

-- [[ LOCAL HELPER FUNCTIONS ]]
local lsp_map_wrap = function(e, mode, key, fn, desc)
  local opts = { buffer = e.buf }
  if desc then
    opts = vim.tbl_deep_extend('force', opts, { desc = desc })
  end
  vim.keymap.set(mode, key, fn, opts)
end

-- [[ KEYMAPS ]]
local ft_keymaps = function(e)
  local client = vim.lsp.get_client_by_id(e.data.client_id)
  local name = client.name
  if name == 'clangd' then
    lsp_map_wrap(e, 'n', '<leader>ch', '<cmd>ClangdSwitchSourceHeader<cr>', 'Switch to source/header')
  elseif name == 'rust_analyzer' then
    lsp_map_wrap(e, 'n', '<leader>cw', '<cmd>CargoReload<cr>', 'Reload current cargo workspace')
  end
end

autocmd('LspAttach', {
  group = dom1153_group,
  callback = function(e)
    lsp_map_wrap(e, 'n', 'gd', vim.lsp.buf.definition, 'LSP go to definition')
    lsp_map_wrap(e, 'n', 'K', vim.lsp.buf.hover, 'LSP hover')
    lsp_map_wrap(e, 'n', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')

    lsp_map_wrap(e, 'n', '<leader>cs', vim.lsp.buf.workspace_symbol, 'Workspace symbol')
    lsp_map_wrap(e, 'n', '<leader>cl', vim.diagnostic.setloclist, 'Diagnostics (location list)')
    lsp_map_wrap(e, { 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    lsp_map_wrap(e, 'n', '<leader>cr', vim.lsp.buf.rename, 'Rename')
    lsp_map_wrap(e, 'n', '<leader>cR', vim.lsp.buf.references, 'References')

    lsp_map_wrap(e, 'i', '<C-h>', vim.lsp.buf.signature_help, 'Signature help')
    lsp_map_wrap(e, 'n', '[d', vim.diagnostic.goto_next, 'Goto next diagnostic')
    lsp_map_wrap(e, 'n', ']d', vim.diagnostic.goto_prev, 'Goto previous diagnostic')

    ft_keymaps(e)
  end,
})

-- [[ SETUP ]]
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- [[ CLANGD ]]
-- relies on compile_commands.json
-- provides formatter
-- https://clangd.llvm.org/installation#compile_commandsjson
require('lspconfig').clangd.setup({})

-- [[ CMAKE ]]
-- only for cmake filetype... and not sure what it does
require('lspconfig').cmake.setup({})

-- [[ LUA ]]
require('lspconfig').lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

-- [[ NIX ]]
require('lspconfig').nil_ls.setup({})

-- [[ RUST (cargo projects only) ]]
require('lspconfig').rust_analyzer.setup({})

-- -- [[ GOLANG (lint server and client) ]]
-- require('lspconfig').golangci_lint_ls.setup({})

-- [[ GOOGLE GOLANG ]]
require('lspconfig').gopls.setup({})

-- requires manual compile zzz
-- -- [[ FISH SHELL ]]
-- require('lspconfig').fish_lsp.setup({})

-- [[ BASH SHELL ]]
require('lspconfig').bashls.setup({})

-- [[ VSCODE WEB ]]
require('lspconfig').cssls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').jsonls.setup({})

-- [[ ASTRO ]]
-- provides formatter
require('lspconfig').astro.setup({})

-- [[ TYPESCRIPT ]]
require('lspconfig').tsserver.setup({})
