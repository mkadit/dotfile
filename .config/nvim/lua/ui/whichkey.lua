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
  ["."] = { '<CMD>lua require("telescope.builtin").file_browser()<CR>', "filer" },
  a = {
    name = "+Action",
    C = { "<CMD>!compiler %<CR>", "Compile file" },
    D = { "<CMD>DBUIToggle<CR>", "Open dad-bod for database" },
    L = { "<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>", "Add file diagnostics to loclist" },
    Q = { "<CMD>lua require('rest-nvim').run()<CR>", "Run http request" },
    c = { "<CMD>ColorizerToggle<CR>", "Colorizer" },
    d = { "<CMD>DogeGenerate<CR>", "Generate docs" },
    e = { "<CMD>setlocal spell! spelllang=en_gb complete+=kspell<CR>", "Spellcheck english" },
    f = { "<CMD>call DiffToggle()<CR>", "Toggle diff" },
    h = { "<CMD>Cheat<CR>", "Cheatsheet" },
    i = { "<CMD>setlocal spell! spelllang=id_id complete+=kspell<CR>", "Spellcheck indo" },
    j = { "<CMD>Rooter<CR>", "To currend directory root" },
    l = { "<CMD>lopen<CR>", "Open loclist" },
    p = { "<CMD>!opout %<CR>", "View files in pdf" },
    q = { "<CMD>copen<CR>", "Open quickfixlist" },
    s = { "<CMD>WriteAndReload<CR>", "Write and reload with current file setting" },
    t = { "<CMD>call TrimWhitespace()<CR>", "Trim Whitespace" },
    u = { "<CMD>UndotreeToggle<CR>", "Undo tree" },
    w = { "<CMD>lcd %:p:h<CR>", "To current folder" },
    -- x = { "<CMD>LspTroubleToggle<CR>", "Show lsp diagnostic" },
    X = { "<CMD>TodoTrouble<CR>", "Show TODOs" },
  },
  t = { "<CMD>AerialToggle<CR>", "Tagbar" },
  n = { "<CMD>NvimTreeToggle<CR>", "File tree" },
  m = { "<CMD>TZFocus<CR>", "Maximizer" },
  v = { "<CMD>Vifm<CR>", "File manager" },
  r = { "<CMD>lua vim.lsp.buf.format({async= true})<CR>", "Format file" },
  f = {
    name = "+Find",
    L = { "<Cmd>Telescope find_files find_command=rg,--ignore,--hidden,--file<CR>", "Hidden files" },
    a = { '<Cmd>lua require("telescope.builtin").autocommands()<CR>', "Autocommands" },
    b = { '<Cmd>lua require("telescope.builtin").buffers()<CR>', "Buffers" },
    c = { '<Cmd>lua require("telescope.builtin").git_commits()<CR>', "Commits" },
    d = { '<CMD>lua require("telescope.builtin").diagnostics()<CR>', "Workspace diagnostic" },
    f = { '<Cmd>lua require("telescope.builtin").find_files()<CR>', "Files" },
    g = { '<Cmd>lua require("telescope.builtin").git_bcommits()<CR>', "Buffer commits" },
    h = { '<Cmd>lua require("telescope.builtin").oldfiles()<CR>', "File history" },
    H = { '<Cmd>lua require("telescope.builtin").command_history()<CR>', "Command history" },
    l = { '<CMD>lua require("telescope.builtin").loclist()<CR>', "Loclist" },
    m = { '<Cmd>lua require("telescope.builtin").man_pages()<CR>', "Man pages" },
    p = { '<CMD>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', "Workspace symbols" },
    P = { '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>', "Document symbols" },
    q = { '<Cmd>lua require("telescope.builtin").quickfix()<CR>', "Quickfix" },
    r = { '<Cmd>lua require("telescope.builtin").live_grep()<CR>', "Ripgrep" },
    t = { '<Cmd>lua require("telescope.builtin").treesitter()<CR>', "Treesitter" },
  },
  g = {
    name = "+Git",
    -- n = {'<CMD>Neogit<CR>', 'Neogit'},
    B = { "<CMD>GBrowse<CR>", "Open file in remote repo" },
    D = { "<CMD>Gdiffsplit<CR>", "Git diff current file" },
    L = { "<CMD>Gclog<CR>", "Git commit log" },
    b = { "<CMD>Git blame<CR>", "Git blame" },
    g = { "<CMD>Flogsplit<CR>", "Commits graph" },
    j = { "<CMD>diffget //2<CR>", "Get left" },
    k = { "<CMD>diffget //3<CR>", "Get right" },
    l = { "<CMD>Git log<CR>", "Git log" },
    m = { ":Git merge ", "Git merge" },
    p = { ":Git push ", "Git push" },
    P = { ":Git pull ", "Git pull" },
    s = { "<CMD>G<CR>", "Git status" },
  },
  G = {
    name = "+Gist",
    g = { "<CMD>Gist<CR>", "Create a gist" },
    p = { "<CMD>Gist -p<CR>", "Create a private gist" },
    a = { "<CMD>Gist -a<CR>", "Create a gist anonymously" },
    m = { "<CMD>Gist -m<CR>", "Crete a gist will all buffers" },
    e = { "<CMD>Gist -e<CR>", "Edit current file gist" },
    d = { "<CMD>Gist -d<CR>", "Delete gist" },
    l = { "<CMD>Gist -l<CR>", "Gist list" },
  },

  s = {
    name = "+Session",
    s = { "<CMD>SSave<CR>", "Save sesion" },
    l = { "<CMD>SLoad<CR>", "Load session" },
    c = { "<CMD>SClose<CR>", "Close session" },
    d = { "<CMD>SDelete<CR>", "Delete sesion" },
  },
  q = {
    name = "+buffers",
    d = { "<CMD>lua MiniBufremove.delete()<CR>", "Close buffer" },
    f = { "<CMD>lua MiniBufremove.delete(0, true)<CR>", "Close buffer force" },
    -- q = {'<CMD>bufdo bd<CR>', 'Close all buffer'},
    -- a = {'<CMD>bufdo bd!<CR>', 'Close all buffer force'},
    -- o = {'<CMD><CMD>%bdelete|edit #|normal \'\"<CR>', 'Close all but current buffer'}
  },
  l = {
    name = "+LSP",
    s = { ":LspStart ", "Start LSP <name>" },
    n = { "<CMD>LspStop<CR>", "Stop LSP" },
    i = { "<CMD>LspInfo<CR>", "Info LSP" },
    r = { "<CMD>LspRestart<CR>", "Restart LSP" },
  },
  d = {
    name = "+Debug",
    b = { "<CMD>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
    i = { "<CMD>lua require'dap'.step_into()<CR>", "Step into" },
    o = { "<CMD>lua require'dap'.step_out()<CR>", "Step out" },
    c = { "<CMD>lua require'dap'.continue()<CR>", "Continue" },
    p = { "<CMD>lua require'dap'.reverse_continue()<CR>", "Reverse continue" },
    f = {
      "<CMD>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "Toggle breakpoint with condition",
    },
    r = { "<CMD>lua require'dap'.run_last()<CR>", "Run last debug settings" },
    R = { "<CMD>lua require'dap'.run_to_cursor()<CR>", "Run until cursor" },
    t = { "<CMD>lua require'dapui'.toggle()<CR>", "Toggle debug UI" },
    F = { "<CMD>lua require'dapui'.float_element()<CR>", "Toggle float" },
    e = { "<CMD>lua require'dapui'.eval()<CR>", "Evaluate" },
    x = { "<CMD>lua require'dapui'.terminate()<CR>", "Terimate" },
    q = { "<CMD>lua require'dap'.list_breakpoints()<CR>", "Send breakpoints to quickfix" },
  },
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
