--[[ VIM GLOBALS ]]
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--[[ VIM OPTIONS ]]
-- Note: vim.o and vim.opt are different ; opt allows you to interact with lua lists
-- where vim.o uses the vimscript string style of 'arrays'

--[[ UI OPTIONS ]]
vim.o.number = true
vim.o.relativenumber = true

-- indent wrapped lines (breakindent)
-- keep words together when wrap is on (linebreak)
vim.o.wrap = false
vim.o.breakindent = true
vim.o.linebreak = true

vim.o.showmode = false

vim.o.signcolumn = 'yes'

-- Enables 24-bit RGB color in the |TUI|.
if vim.fn.has('termguicolors') then
  vim.o.termguicolors = true
end

--- show whitepspace symbols
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:-,nbsp:␣' -- eol:↲ --   and

vim.o.cursorline = true

vim.o.hlsearch = true

vim.o.cmdheight = 2

-- Maximum number of items to show in the popup menu (0 means "use available screen space")
vim.o.pumheight = 0

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

--[[ BEHAVIOR OPTIONS ]]
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim. :help clipboard

-- Enable persistent undo history
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 3

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.grepprg = 'rg --vimgrep'
vim.o.grepformat = '%f:%l:%c:%m'

-- save before executing certain commands (e.g. make)
vim.o.autowrite = true

vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- some autocmd or startup task is breaking shortmess
-- we don't need it anyways
vim.opt.shortmess:append('I')

-- keeps traditional vim gg/G (nvim default keeps column location on gg/G motion
vim.o.startofline = true

-- TODO: put this in conform???
-- Use conform-nvim for gq formatting. ('formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it)
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
