-- note: lsp does not activate until edit (mode) begins

-- require to be inside a directory with the title 'nixvim'
require('neodev').setup {
  override = function(root_dir, library)
    if root_dir:find('/nvim-flake', 1, true) == 1 or root_dir:find('/nixvim', 1, true) == 1 then
      library.enabled = true
      library.plugins = true
    end
  end,
}

-- then setup your lsp server as usual
local lspconfig = require('lspconfig')

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
    telemetry = {
      enabled = false,
    },
    hint = {
      enable = true,
    },
  },
}
