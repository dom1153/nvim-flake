if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

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

-- [[ TELESCOPE KEYMAPS ]]
-- [f]ind group
vim.keymap.set('n', "<leader>f'", builtin.marks, { desc = ' Marks' })
vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find, { desc = '  Grep (buffer)' })
vim.keymap.set('n', '<leader>f:', builtin.command_history, { desc = ' Command history' })
vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = ' [T]elescope pickers' })
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

-- [[ TELESCOPE SETUP ]]
telescope.setup {
  defaults = require('telescope.themes').get_dropdown {},
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension('fzy_native')
