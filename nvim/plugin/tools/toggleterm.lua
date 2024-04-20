if vim.g.did_load_toggleterm_plugin then
  return
end
vim.g.did_load_toggleterm_plugin = true

-- [[ DEFINES ]]
local group_key = 'T'

-- [[ HELPER FUNCTIONS ]]

---@param group_key string the group key
---@param key string the final key to press
---@param direction string horizontal, vertical, tab, or float
---@param scope string default root, else local
local function tt_wrap(group_key, key, direction, scope)
  -- scope = if scope then 'dir=%:p:h' else ''
  if scope == 'local' then
    scope_directory = 'dir=%:p:h'
    scope_key_label = '(cwd)'
  else
    scope_directory = ''
    scope_key_label = '(root)'
  end

  local direction_key_label = direction
  if 'horizontal' == direction or 'vertical' == direction then
    direction_key_label = direction .. ' ' .. 'split'
  end

  local string = require('string')
  local lhs = '<leader>' .. group_key .. key
  local rhs = string.format('<cmd>ToggleTerm %s direction=%s name=term-%s<cr>', scope_directory, direction, direction)
  local desc = string.format('Terminal %s %s', direction_key_label, scope_key_label)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

-- [[ KEYMAPS ]]
tt_wrap(group_key, 'v', 'vertical', 'local')
tt_wrap(group_key, 'V', 'vertical', 'root')
tt_wrap(group_key, 's', 'horizontal', 'local')
tt_wrap(group_key, 'S', 'horizontal', 'root')
tt_wrap(group_key, 'f', 'float', 'local')
tt_wrap(group_key, 'F', 'float', 'root')
tt_wrap(group_key, 't', 'tab', 'local')
tt_wrap(group_key, 'T', 'tab', 'root')
--

--
-- -- [[ toggleterm SETUP ]]
require('toggleterm').setup {
  size = function(term)
    if term.direction == 'horizontal' then
      return vim.o.lines * 0.3
      -- return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
      -- return 80
    end
  end,
  shell = function()
    if vim.fn.executable('fish') == 1 then
      return 'fish'
    else
      return vim.o.shell
    end
  end,
  -- :help :map-special-keys , <c-/>
  open_mapping = [[<c-_>]],
  direction = 'float',
}

-- wk.register({
--   T = {
--     -- vertical split
--     v = {
--       '<cmd>ToggleTerm dir=%:p:h direction=vertical name=Term-V-cwd<CR>',
--       'Terminal Vertical Split (cwd)',
--     },
--     V = {
--       '<cmd>ToggleTerm direction=vertical name=Term-V-root<CR>',
--       'Terminal Vertical Split (root)',
--     },
--
--     -- horizontal
--     s = {
--       '<cmd>ToggleTerm dir=%:p:h direction=horizontal name=Term-H-cwd<CR>',
--       'Terminal Horizontal Split (cwd)',
--     },
--     S = {
--       '<cmd>ToggleTerm direction=horizontal name=Term-H-root<CR>',
--       'Terminal Horizontal Split (root)',
--     },
--
--     -- float
--     f = {
--       '<cmd>ToggleTerm dir=%:p:h direction=float name=Term-F-root<CR>',
--       'Terminal Float (cwd)',
--     },
--     F = {
--       '<cmd>ToggleTerm direction=float name=Term-F-root<CR>',
--       'Terminal Float (root)',
--     },
--
--     -- tab
--     t = {
--       '<cmd>ToggleTerm dir=%:p:h direction=tab name=Term-T-root<CR>',
--       'Terminal Tab (cwd)',
--     },
--     T = {
--       '<cmd>ToggleTerm direction=tab name=Term-T-root<CR>',
--       'Terminal Tab (root)',
--     },
--   },
-- }, { prefix = '<leader>' })
