-- local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local opt = vim.o

--[[ VIM GLOBALS ]]

-- <leader> key. Defaults to `\`. Some people prefer space.
g.mapleader = ' '
g.maplocalleader = ' '

--[[ VIM OPTIONS ]]

-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
opt.number = true
opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = 'unnamedplus'

-- indent wrapped lines
opt.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true
opt.grepprg = 'rg --vimgrep'
opt.grepformat = '%f:%l:%c:%m'

-- Keep signcolumn on by default, prevents the screen from jumping
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 50 -- 4000ms by default, try 50, 250
opt.timeoutlen = 10 -- (used for which-key)

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect,noinsert' -- mostly just for cmp

-- Enable persistent undo history
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--   See `:help 'list'`
--   and `:help 'listchars'`
opt.list = true
opt.listchars = 'tab:» ,trail:-,nbsp:␣' -- eol:↲

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo--minimal-configuration
opt.foldcolumn = '0'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 8

-- Set highlight on search, but clear on pressing <Esc> in normal mod
opt.hlsearch = true

-- Enables 24-bit RGB color in the |TUI|.
if fn.has('termguicolors') then
  opt.termguicolors = true
end

-- Set encoding type
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- More space in the neovim command line for displaying messages
opt.cmdheight = 2

-- Maximum number of items to show in the popup menu (0 means "use available screen space")
opt.pumheight = 0

-- save before executing certain commands
opt.autowrite = true

-- Use conform-nvim for gq formatting. ('formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it)
opt.formatexpr = "v:lua.require'conform'.formatexpr()"

-- disable text wrap by default
opt.wrap = false
