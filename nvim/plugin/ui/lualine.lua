if vim.g.did_load_lauline_plugin then
  return
end
vim.g.did_load_lauline_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]
local navic = require('nvim-navic')
navic.setup({
  lsp = {
    auto_attach = true,
  },
})

-- [[ HELPER FUNCTIONS ]]
local function win_count()
  -- # is the length operator
  return 1 < #vim.api.nvim_tabpage_list_wins(0)
end

-- Hint: measure size with vim.api.nvim_get_width(0)
-- Too tedious... if you really want something pin it in (inactive) winbar (e.g. diagnostics)
--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  hide_width = hide_width or 40

  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

local function lsp_server_name()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    return client.name
  end
  return msg
end

-- [[ KEYMAPS ]]

-- [[ SETUP ]]
-- :h lualine-Default-configuration
require('lualine').setup({
  options = {
    globalstatus = true, -- vim clean does not use global status
  },
  sections = {
    lualine_a = {
      {
        'mode',
      },
    },
    lualine_b = {
      'diff',
      'diagnostics',
    },
    lualine_c = {
      {
        'filename',
      },
    },

    lualine_x = {
      {
        lsp_server_name,
        icon = 'LSP:',
        color = { fg = '#ffffff', gui = 'bold' },
      },
    },
    lualine_y = {
      {
        'filetype',
      },
      {
        '%L  ',
      },
    },
    lualine_z = {
      '%l:%c',
    },
  },

  tabline = {
    lualine_a = { 'tabs' },
    lualine_b = {
      -- for non-standard filetypes like mini.files or telescope
      'filetype',
    },
  },

  winbar = {
    lualine_b = {
      {
        -- "placeholder",
        -- separator = { left = " ", right = " " },
        -- draw_empty = true,
        'filename',
        path = 1, -- relative
        use_mode_colors = false,
        cond = win_count,
      },
    },
  },
  inactive_winbar = {
    lualine_a = {
      {
        'filename',
        path = 1, -- relative
        use_mode_colors = false,
      },
    },
  },
})
