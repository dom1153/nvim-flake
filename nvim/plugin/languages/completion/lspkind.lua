if vim.g.did_load_lspkind_plugin then
  return
end
vim.g.did_load_lspkind_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]
require('lspkind').init {
  -- there exist presets
  symbol_map = {
    Text = '󰊄',
    Method = '󰕳',
    Function = '󰊕',
    Constructor = '',
    Field = '',
    Variable = '󰀫',
    Class = '󰠱',
    Interface = '',
    Module = '',
    Property = '󰜢',
    Unit = '󰑭',
    Value = '󰎠',
    Enum = '',
    Keyword = '󰌋',
    Snippet = '',
    Color = '󰏘',
    File = '󰈙',
    Reference = '󰈇',
    Folder = '󰉋',
    EnumMember = '',
    Constant = '󰏿',
    Struct = '󰙅',
    Event = '',
    Operator = '󰆕',
    TypeParameter = '',
  },
}
