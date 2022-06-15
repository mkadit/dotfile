local o = vim.opt
local g = vim.g
local fn = vim.fn

-- o.colorcolumn    = { "80" } -- 80 chars color column
-- o.foldcolumn     = "1" -- enable fold column for better visualisation
o.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldlevel      = 99 -- don't fold anything if I don't tell it to do so
-- o.foldmethod     = "expr"
-- o.foldminlines   = 5 -- don't fold anything below 5 lines
-- o.foldnestmax    = 99
-- o.foldopen       = { "percent", "search", } -- don't open fold if I don't tell it to do so
-- o.diffopt:append { "algorithm:histogram", "indent-heuristic" }
o.autoindent = true -- enable autoindent
o.autoread = true
o.autowrite = false -- auto write buffer when it's not focused
o.backspace = "indent,eol,start"
o.backup = true -- enable backup
o.backupcopy = "yes" -- make a copy of the file and overwrite the original
o.backupdir = fn.stdpath "data" .. "/backup"
o.binary = false -- For editing binary file
o.clipboard = "unnamedplus"
o.cmdheight = 2 -- Number of screen lines use for the command-line
o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- better completion
o.cursorcolumn = false -- disable cursor column
o.cursorline = false -- disable cursor line
o.encoding = "UTF-8" -- set encoding
o.equalalways = true -- make window size always equal
o.expandtab = true -- use spaces instead of tabs
o.fillchars = { vert = "│", eob = " ", fold = " ", diff = " " } -- make vertical split sign better
o.hidden = true -- keep hidden buffers
o.hlsearch = true -- highlight matching search
o.ignorecase = true -- case insensitive on search..
o.inccommand = "split" -- incrementally show result of command
o.joinspaces = false
o.laststatus = 3 -- always enable statusline
o.lazyredraw = true -- make macro faster
o.list = true -- display listchars
o.listchars = { eol = "↲", tab = "» ", nbsp = "␣", trail = "•", extends = "»", precedes = "«" } -- set listchars
o.mouse = "nvi" -- enable mouse support in normal, insert, and visual mode
o.number = true -- enable line number
o.pumheight = 10 -- limit completion items
o.re = 0 -- set regexp engine to auto
o.relativenumber = true -- enable relative line number
o.report = 2 -- Threshold for reporting line
o.ruler = true -- Show line and column
o.scrolloff = 2 -- make scrolling better
o.shell = "/usr/bin/bash" -- use bash instead of zsh
o.shiftwidth = 2 -- set indentation width
o.shortmess = "csa" -- disable some stuff on shortmess
o.showmode = false -- don't show mode
o.sidescroll = 2 -- make scrolling better
o.sidescrolloff = 15 -- make scrolling better
o.signcolumn = "yes" -- enable sign column all the time 4 column
o.smartcase = true -- ..unless there's a capital
o.smartindent = true -- smarter indentation
o.smarttab = true -- make tab behaviour smarter
o.splitbelow = true -- split below instead of above
o.splitright = true -- split right instead of left
o.startofline = false -- don't go to the start of the line when moving to another file
o.swapfile = false -- disable swapfile
o.tabstop = 2 -- tabsize
o.termguicolors = true -- true colours for better experience
o.timeoutlen = 400 -- faster timeout wait time / 50
o.undodir = fn.stdpath "data" .. "/undo"
o.undofile = true -- persistent undo
o.updatetime = 1000 -- set faster update time / 300
o.wrap = false -- don't wrap lines
o.writebackup = true -- disable backup

if fn.executable "rg" == 1 then
  o.grepprg = "rg --vimgrep --no-heading"
  o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  g.gitgutter_grep = "rg"
end

-- Global option
g.mapleader = " "
g.doge_enable_mappings = 0
g.rooter_manual_only = 1
g.vista_default_executive = "nvim_lsp"
g.python3_host_prog = "/usr/bin/python3"

-- Colorscheme
vim.cmd "syntax enable"
-- require('base16-colorscheme').setup('nord')
