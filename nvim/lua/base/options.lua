--[[ VIM GLOBALS ]]

-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--[[ VIM OPTIONS ]]

-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- indent wrapped lines
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.grepprg = 'rg --vimgrep'
vim.o.grepformat = '%f:%l:%c:%m'

-- Keep signcolumn on by default, prevents the screen from jumping
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50 -- 4000ms by default, try 50, 250
vim.o.timeoutlen = 10 -- (used for which-key)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,noinsert' -- mostly just for cmp

-- Enable persistent undo history
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--   See `:help 'list'`
--   and `:help 'listchars'`
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:-,nbsp:␣' -- eol:↲

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo--minimal-configuration
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 8

-- Set highlight on search, but clear on pressing <Esc> in normal mod
vim.o.hlsearch = true

-- Enables 24-bit RGB color in the |TUI|.
if vim.fn.has('termguicolors') then
  vim.o.termguicolors = true
end

-- Set encoding type
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- More space in the neovim command line for displaying messages
vim.o.cmdheight = 2

-- Maximum number of items to show in the popup menu (0 means "use available screen space")
vim.o.pumheight = 0

-- save before executing certain commands
vim.o.autowrite = true

-- Use conform-nvim for gq formatting. ('formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it)
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- disable text wrap by default
vim.o.wrap = false

-- some autocmd or startup task is breaking shortmess
-- we don't need it anyways
vim.opt.shortmess:append('I')

-- keeps traditional vim g/GG
vim.o.startofline = true
