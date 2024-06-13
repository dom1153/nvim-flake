if vim.g.did_load_obsidian_plugin then
  return
end
vim.g.did_load_obsidian_plugin = true

-- Note: I don't like that this plugin auto-creates daily and concepts folder...

-- [[ VIM OPTIONS ]]
-- -- hides formatting unless cursor-over, like obsidian hybrid
-- vim.o.conceallevel = 1

-- [[ DEFINES ]]
local util = require('obsidian.util')

-- [[ HELPER FUNCTIONS ]]
local my_toggle_checkbox = function()
  -- default checkboxes: [ ] [~] [>] [x]
  util.toggle_checkbox({ ' ', 'x' })
end

local smart_action = function()
  if util.cursor_on_markdown_link(nil, nil, true) then
    -- follow link if possible
    vim.cmd('ObsidianFollowLink')
  else
    my_toggle_checkbox()
  end
end

-- [[ KEYMAPS ]]
vim.keymap.set('n', '<leader>Oy', '<cmd>ObsidianToday<cr>', { desc = "Open today's daily note" })
vim.keymap.set('n', '<leader>Od', '<cmd>ObsidianDailies -10<cr>', { desc = ' Find daily note' })
vim.keymap.set('n', '<leader>Oo', '<cmd>ObsidianQuickSwitch<cr>', { desc = ' Quick switcher' })
vim.keymap.set('n', '<leader>O/', '<cmd>ObsidianSearch<cr>', { desc = ' Search in all files' })

-- [[ Commands only in Obsidian folder, and must be markdown files ]]
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = vim.api.nvim_create_augroup('obsidian_setup_mine', { clear = true }),
  pattern = vim.fn.expand('~/Documents/Obsidian') .. '*.md',
  callback = function()
    vim.b.autoformat = false
    vim.keymap.set('n', 'gf', util.gf_passthrough, { noremap = false, expr = true, buffer = true, desc = 'Go File (obsidian.nvim)' })
    vim.keymap.set('n', 'gd', util.gf_passthrough, { noremap = false, expr = true, buffer = true, desc = 'Go File (obsidian.nvim)' })
    vim.keymap.set({ 'n', 'i' }, '<c-j>', '<cmd>ObsidianTemplate<cr>', { buffer = true, desc = ' Open template picker' })
    vim.keymap.set('n', '<cr>', smart_action, { buffer = true })
    vim.keymap.set('n', '<c-l>', my_toggle_checkbox, { buffer = true, desc = 'Toggle checkboxes' })
    vim.keymap.set('n', '<leader>Ot', '<cmd>ObsidianTemplate<cr>', { buffer = true, desc = ' Open template picker' })
    vim.keymap.set('n', '<leader>Ob', '<cmd>ObsidianBacklinks<cr>', { buffer = true, desc = ' Find backlinks' })
    vim.keymap.set('n', '<leader>Ol', '<cmd>ObsidianLinks<cr>', { buffer = true, desc = ' Links in buffer' })
  end,
})

-- [[ SETUP ]]
require('obsidian').setup({
  workspaces = {
    {
      name = 'brain2',
      path = '~/Documents/Obsidian/Brain2',
    },
  },
  notes_subdir = 'Concepts 🔗',
  new_notes_location = 'notes_subdir',
  -- adds id, alias, tags as metadata
  disable_frontmatter = true,
  daily_notes = {
    folder = '_Daily Notes 📅',
    template = 'Daily Template',
  },
  -- mappings are normal mode only, so use custom mapping
  mappings = {},
  -- complete note names
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  templates = {
    subdir = 'Templates 🔁',
    date_format = 'YYYY-MM-DD',
    time_format = '%H:%M',
    -- manually substitue because obsidian uses moment.js
    -- https://www.lua.org/pil/22.1.html
    -- https://momentjs.com/docs/#/displaying/format/
    substitutions = {
      ['date:YYYYMMDD'] = function()
        return os.date('%Y%m%d', os.time())
      end,
      ['time:HHmm'] = function()
        return os.date('%H%M', os.time())
      end,
      ['date:ddd MMM DD, YYYY'] = function()
        return os.date('%a %b %d, %Y', os.time())
      end,
      ['date:YYYY'] = function()
        return os.date('%Y', os.time())
      end,
      ['date:ww'] = function()
        -- week representaion is one off, but we have math
        -- https://stackoverflow.com/questions/68726551/how-to-add-days-to-a-date-generated-by-os-date-in-lua
        local t = os.time()
        print(os.date('%c', t))
        local d = 7
        t = t + d * 24 * 60 * 60
        print(os.date('%c', t))
        return os.date('%U', t)
      end,
    },
  },
})
