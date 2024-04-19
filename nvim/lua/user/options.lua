if vim.g.did_load_base_options then
  return
end
vim.g.did_load_base_options = true

local cmd = vim.cmd
local fn = vim.fn
local opt = vim.o
local g = vim.g

-- <leader> key. Defaults to `\`. Some people prefer space.
g.mapleader = ' '
g.maplocalleader = ' '
