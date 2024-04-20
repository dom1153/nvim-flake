--[[
  Initialization order:
    1. nvim/lua added to the runtimepath.
    2. Load the contents of nvim/init.lua.
    3. nvim/* added to the runtimepath.
    4. nvim/after added to the runtimepath.
  Modules in nvim/plugin/ are sourced automatically, as if they were plugins. 
  Because they are added to the runtime path at the end of the resulting init.lua,
  Neovim sources them after loading plugin
]]

require('base/options')
require('base/autocmd')
require('base/neovide')

require('keymaps/general')
require('keymaps/toggles')
