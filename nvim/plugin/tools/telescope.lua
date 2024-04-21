if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

-- [[ DEFINES ]]
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- [[ HELPER FUNCTIONS ]]
-- Fall back to find_files if not in a git repo
local project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

--- TODO: see git thread and see if there's a faster version
--- Like live_grep, but fuzzy (and slower)
local function fuzzy_grep(opts)
  opts = vim.tbl_extend('error', opts or {}, { search = '', prompt_title = 'Fuzzy grep' })
  builtin.grep_string(opts)
end

local function fuzzy_grep_current_file_type()
  grep_current_file_type(fuzzy_grep)
end

local function buffer_mru()
  vim.cmd('Telescope buffers sort_mru=true sort_lastused=true')
end

-- [[ TELESCOPE KEYMAPS ]]
-- [f]ind group
vim.keymap.set('n', "<leader>f'", builtin.marks, { desc = ' Marks' })
vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find, { desc = ' Grep (buffer)' })
vim.keymap.set('n', '<leader>fb', buffer_mru, { desc = ' Buffers' })
vim.keymap.set('n', '<leader>f:', builtin.command_history, { desc = ' Command history' })
vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = ' [T]elescope pickers' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope glyph<cr>', { desc = ' Nerfont glyphs' })
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope emoji<cr>', { desc = ' Emojis' })
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<CR>', { desc = ' Undo tree' })
-- [g]it group
vim.keymap.set('n', '<leader>gd', builtin.git_bcommits, { desc = ' Git diff history' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = ' Git files' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = ' Git status' })
-- [v]im group
vim.keymap.set('n', '<leader>vc', builtin.commands, { desc = ' Vim commands' })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = ' Vim help pages' })
vim.keymap.set('n', '<leader>vi', builtin.highlights, { desc = ' Vim h[i]ghlight groups' })
vim.keymap.set('n', '<leader>vk', builtin.keymaps, { desc = ' Vim keymaps' })
vim.keymap.set('n', '<leader>vm', builtin.man_pages, { desc = ' Vim man pages' })
vim.keymap.set('n', '<leader>vo', builtin.vim_options, { desc = ' Vim options' })
vim.keymap.set('n', '<leader>vr', builtin.oldfiles, { desc = ' Vim [r]ecent files (global)' })
-- base group
vim.keymap.set('n', '<leader>/', fuzzy_grep, { desc = ' Grep files' })
vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = ' Find files' })
vim.keymap.set('n', '<leader>o', buffer_mru, { desc = ' Buffers' })

-- [[ TELESCOPE SETUP ]]
telescope.setup({
  -- need to override width/height for cheatsheet.nvim
  defaults = require('telescope.themes').get_dropdown({
    layout_config = {
      width = 80,
      height = 15,
    },
  }),
  -- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    emoji = {
      -- -- emoji list supports https://emojipedia.org/emoji-4.0
      -- -- emoji =  {name="", value="", cagegory="", description=""}
      action = function(emoji)
        -- copy to clipboard >:3
        vim.fn.setreg('+', emoji.value)
        -- insert emoji into buffer
        vim.api.nvim_put({ emoji.value }, 'c', false, true)
        -- notify user
        print([[Selected "]] .. emoji.value .. [[" and copied to clipboard]])
      end,
    },
    glyph = {
      action = function(glyph)
        -- copy to clipboard >:3
        vim.fn.setreg('+', glyph.value)
        -- insert glyph into buffer
        vim.api.nvim_put({ glyph.value }, 'c', false, true)
        -- notify user
        print([[Selected "]] .. glyph.value .. [[" and copied to clipboard]])
      end,
    },
    undo = {},
  },
})

-- [[ LOAD EXTENSION CALLS ]]
telescope.load_extension('emoji')
telescope.load_extension('fzy_native')
telescope.load_extension('glyph')
telescope.load_extension('undo')
