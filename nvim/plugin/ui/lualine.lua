if vim.g.did_load_lauline_plugin then
  return
end
vim.g.did_load_lauline_plugin = true

-- [[ VIM OPTIONS ]]

-- [[ DEFINES ]]

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

-- lua print(vim.inspect(vim.lsp.get_active_clients()))
-- Note: many keys in lsp client config are arbitrarily defined (e.g. filetypes)
local function lsp_server_name()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

local function logo()
  return ' NEOVIM'
end

-- doesn't display well (appears to have a 'space' to the right'
local function num_to_jp_sym(num)
  local cases = {
    [1] = '一',
    [2] = '二',
    [3] = '三',
    [4] = '四',
    [5] = '五',
    [6] = '六',
    [7] = '七',
    [8] = '八',
    [9] = '九',
    [10] = '十',
  }

  return cases[num] or num
end

local function tab_fmt(name, context)
  -- Show + if buffer is modified in tab
  -- local buflist = vim.fn.tabpagebuflist(context.tabnr)
  -- local winnr = vim.fn.tabpagewinnr(context.tabnr)
  -- local bufnr = buflist[winnr]
  -- local mod = vim.fn.getbufvar(bufnr, '&mod')

  -- return num_to_jp_sym(context.tabnr) .. (mod == 1 and ' [+]' or '')
  -- return context.tabnr .. (mod == 1 and ' [+]' or '')

  -- do this so [+] appears on the left, with nicer spacing
  return context.tabnr
end

-- it's a hack but it'll do
local function filename_ignore_toggleterm()
  return vim.bo.filetype ~= 'toggleterm'
end

-- [[ KEYMAPS ]]

-- [[ SETUP ]]
-- :h lualine-Default-configuration
require('lualine').setup({
  options = {
    theme = 'catppuccin',
    globalstatus = true, -- vim clean does not use global status
    -- tabline separator color is broken. so we'll just disable them completely
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
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
        cond = filename_ignore_toggleterm,
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
    lualine_a = {
      {
        logo,
      },
    },

    lualine_z = {
      {
        'tabs',
        mode = 1, -- tab names (required to use fmt)
        -- symbols = { modified = '' },
        fmt = tab_fmt,
      },
    },
  },

  winbar = {
    lualine_b = {
      {
        -- make separator a space to still allow transparent background for the rest of the winbar
        separator = { left = '', right = ' ' },
        -- draw_empty = true,
        'filename',
        path = 1, -- relative
        use_mode_colors = false,
        cond = filename_ignore_toggleterm,
        -- cond = win_count, -- not smart enough unforunately (e.g. gcc causes flicker)
      },
    },
  },
  inactive_winbar = {
    lualine_a = {
      {
        'filename',
        path = 1, -- relative
        use_mode_colors = false,
        separator = '',
        cond = filename_ignore_toggleterm,
      },
    },
  },
})
