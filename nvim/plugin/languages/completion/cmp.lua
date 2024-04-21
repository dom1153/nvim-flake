if vim.g.did_load_completion_plugin then
  return
end
vim.g.did_load_completion_plugin = true

-- [[ VIM OPTIONS ]]
-- Set completeopt to have a better completion experience
-- HINT: noselect?
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert' }

-- [[ DEFINES ]]
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- [[ HELPER FUNCTIONS ]]

-- [[ KEYMAPS ]]

-- [[ SETUP ]]
cmp.setup {
  performance = {
    debounce = 60,
    fetching_timeout = 200,
    maxView_entries = 30,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
    -- autocomplete = false,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    },

    fields = { 'kind', 'abbr', 'menu' },
    expandable_indicator = true,
  },
  window = {
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
    },
    documentation = {
      border = 'rounded',
    },
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources {
    -- The insertion order influences the priority of the sources
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffer', get_bufnrs = 'vim.api.nvim_list_bufs', keyword_length = 3 }, -- text within the buffer
    { name = 'path', keyword_length = 3 },
    -- { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 3 },
  },
  enabled = function()
    return vim.bo[0].buftype ~= 'prompt'
  end,
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'nvim_lsp_document_symbol', keyword_length = 3 },
    { name = 'buffer' },
    { name = 'cmdline_history' },
  },
  view = {
    entries = { name = 'wildmenu', separator = '|' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'cmdline' },
    { name = 'cmdline_history' },
    { name = 'path' },
  },
})

-- do I need to enable extensions?
