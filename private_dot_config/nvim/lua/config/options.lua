-- This file is automatically loaded by plugins.config

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt
local g = vim.g
local fn = vim.fn

-- o.re                   = 0 -- set regexp engine to auto
-- o.report               = 2 -- Threshold for reporting line
-- o.ruler                = true -- Show line and column
-- o.shell                = "/usr/bin/bash" -- use bash instead of zsh
-- o.shortmess            = "csa" -- disable some stuff on shortmess
-- o.sidescroll           = 2 -- make scrolling better
-- o.startofline          = false -- don't go to the start of the line when moving to another file
-- o.writebackup = true -- disable backup
o.autoindent = true -- enable autoindent
o.autoread = true
o.autowrite = false -- auto write buffer when it's not focused
o.backspace = "indent,eol,start"
o.backup = true -- enable backup
o.backupcopy = "yes" -- make a copy of the file and overwrite the original
o.backupdir = fn.stdpath("data") .. "/backup"
o.clipboard = "unnamedplus" -- Sync with system clipboard
o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- better completion
o.conceallevel = 3 -- Hide * markup for bold and italic
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.cursorcolumn = false -- disable cursor column
o.cursorline = true -- Enable highlighting of the current line
o.encoding = "UTF-8" -- set encoding
o.equalalways = true -- make window size always equal
o.expandtab = true -- Use spaces instead of tabs
o.fillchars = { vert = "│", eob = " ", fold = " ", diff = " " } -- make vertical split sign better
o.formatoptions = "jcroqlnt" -- tcqj
o.grepformat = "%f:%l:%c:%m"
o.hidden = true -- keep hidden buffers
o.hlsearch = true -- highlight matching search
o.ignorecase = true -- Ignore case
o.inccommand = "split" -- preview incremental substitute
o.joinspaces = false
o.laststatus = 0 -- never enable statusline for last window
o.list = true -- Show some invisible characters (tabs...
o.listchars = { eol = "↲", tab = "» ", nbsp = "␣", trail = "•", extends = "»", precedes = "«" } -- set listchars
o.mouse = "a" -- Enable mouse mode
o.number = true -- Print line number
o.pumblend = 10 -- Popup blend
o.pumheight = 10 -- Maximum number of entries in a popup
o.relativenumber = true -- Relative line numbers
o.scrolloff = 4 -- Lines of context
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
o.shiftround = true -- Round indent
o.shiftwidth = 2 -- Size of an indent
o.shortmess:append({ W = true, I = true, c = true })
o.showmode = false -- Dont show mode since we have a statusline
o.sidescrolloff = 8 -- Columns of context
o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true -- Don't ignore case with capitals
o.smartindent = true -- Insert indents automatically
o.smarttab = true -- make tab behaviour smarter
o.spelllang = { "en" }
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.swapfile = false -- disable swapfile
o.tabstop = 2 -- Number of spaces tabs count for
o.termguicolors = true -- True color support
o.timeoutlen = 300
o.undodir = fn.stdpath("data") .. "/undo"
o.undofile = true -- persistent undo
o.undolevels = 10000
o.updatetime = 200 -- Save swap file and trigger CursorHold
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winbar = "%=%m %f" -- set winbar
o.winminwidth = 5 -- Minimum window width
o.wrap = false -- don't wrap lines

if vim.fn.has("nvim-0.9.0") == 1 then
  o.splitkeep = "screen"
  o.shortmess:append({ C = true })
end

-- Use rg if available
if fn.executable("rg") == 1 then
  o.grepprg = "rg --vimgrep --no-heading"
  o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  g.gitgutter_grep = "rg"
end

g.markdown_recommended_style = 0
g.rooter_manual_only = 1
