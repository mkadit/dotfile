-- Add the value of all table 2 to table 1
local function add_table(table1, table2)
  for k, v in pairs(table2) do
    table1[k] = v
  end
end

local wk = require "which-key"

wk.setup {

  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
}

local leader_keymap = {
  name = "+plugins",
  a = {
    name = "+Action",
  },
  d = {
    name = "+Debug",
  },
  f = {
    name = "+Find",
  },
  G = {
    name = "+Gist",
  },
  g = {
    name = "+Git",
  },
  l = {
    name = "+LSP",
  },
  m = {
    name = "+Harpoon",
  },
  q = {
    name = "+Buffers",
    -- q = {'<CMD>bufdo bd<CR>', 'Close all buffer'},
    -- a = {'<CMD>bufdo bd!<CR>', 'Close all buffer force'},
  },
  s = {
    name = "+Session",
  },
  T = {
    name = "+Testing",
  },
  t = {
    name = "+Tabs",
    m = {
      name = "+Move"
    }
  },
  v = { "<CMD>Vifm<CR>", "File manager" },
}

local unimpaired = {
  name = "+set",
  l = "Listline",
  b = "Background",
  c = "Cursorline",
  d = "Diff",
  h = "Search highlight",
  i = "Ignore case",
  r = "Relativenumber",
  n = "Number",
  s = "Spell",
  u = "Cursorcolumn",
  ["|"] = "Cursorcolumn",
  v = "Virtualedit",
  w = "Wrap",
  x = "Crosshair",
  ["-"] = "Cursorline",
  ["_"] = "Cursorline",
  ["+"] = "Crosshair",
}

local brackets = {
  o = unimpaired,
  b = "Buffer",
  l = "Loclist",
  -- a = "Next edit",
  q = "Quickfix",
  n = "Hunk",
  t = "Tag",
  e = "Line swap",
  s = "Misspelled word",
  [" "] = "Add blank cursor",
}

local ataraxis = {
  T = { "<cmd>TZTop<CR>", "Toggle top" },
  B = { "<cmd>TZBottom<CR>", "Toggle bottom" },
  L = { "<cmd>TZLeft<CR>", "Toggle left" },
  M = { "<cmd>TZMinimalist<CR>", "Minimal" },
  A = { "<cmd>TZAtaraxis<CR>", "Ataraxis" },
}

add_table(unimpaired, ataraxis)

local right_bracket = { name = "+next/off" }
local left_bracket = { name = "+prev/on" }
local y = { name = "+yank/toggle", o = unimpaired }

add_table(right_bracket, brackets)
add_table(left_bracket, brackets)

-- Trigger
wk.register { ["<leader>"] = leader_keymap }
wk.register { ["]"] = right_bracket }
wk.register { ["["] = left_bracket }
wk.register { y = y }
