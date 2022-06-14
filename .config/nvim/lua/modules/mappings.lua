local keymap = vim.keymap
-- TODO: Tidy this

-- Disable keys
keymap.set("n", "Q", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-z>", "<Nop>", { noremap = true, silent = true })

-- Sourcing
keymap.set("n", "<Leader>as", "<CMD>WriteAndReload<CR>", { noremap = true, silent = false })

-- Find file Root
keymap.set("n", "<Leader>aw", "<CMD>lcd %:p:h<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>aj", "<CMD>Rooter<CR>", { noremap = true, silent = false })

-- Misc Things
keymap.set("t", "<ESC><ESC>", "<c-\\><c-n>", { noremap = true, silent = false })
keymap.set("n", "<ESC><ESC>", "<CMD>nohlsearch<CR>", { noremap = true, silent = false })

keymap.set("n", "<Leader>aC", "<CMD>!compiler %<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>aD", "<CMD>DBUIToggle<CR>", { noremap = true, silent = false })
keymap.set(
  "n",
  "<Leader>ae",
  "<CMD>setlocal spell! spelllang=en_gb complete+=kspell<CR>",
  { noremap = true, silent = false }
)
keymap.set("n", "<Leader>af", "<CMD>call DiffToggle()<CR>", { noremap = true, silent = false })
keymap.set(
  "n",
  "<Leader>ai",
  "<CMD>setlocal spell! spelllang=id_id complete+=kspell<CR>",
  { noremap = true, silent = false }
)
keymap.set("n", "<Leader>ap", "<CMD>!opout %<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>aq", "<CMD>copen<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>al", "<CMD>lopen<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>ax", "<CMD>TroubleToggle workspace_diagnostics<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>aX", "<CMD>TodoTrouble<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>aQ", "<CMD>lua require('rest-nvim').run()<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>at", "<CMD>call TrimWhitespace()<CR>", { noremap = true, silent = false })
keymap.set("x", "gl", ":EasyAlign<CR>", { noremap = true, silent = false })
keymap.set("n", "gl", ":EasyAlign<CR>", { noremap = true, silent = false })
keymap.set("x", "gL", ":LiveEasyAlign<CR>", { noremap = true, silent = false })
keymap.set("n", "gL", ":LiveEasyAlign<CR>", { noremap = true, silent = false })

-- Colorizer
keymap.set("n", "<Leader>ac", "<CMD>ColorizerToggle<CR>", { noremap = true, silent = false })

-- Undo tree
keymap.set("n", "<Leader>au", "<CMD>UndotreeToggle<CR>", { noremap = true, silent = false })

-- Document generate
keymap.set("n", "<Leader>ad", "<CMD>DogeGenerate<CR>", { noremap = true, silent = false })

-- Resizing Panes
keymap.set("n", "<C-Left>", "<CMD>vertical resize +5<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-Up>", "<CMD>resize -5<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-Right>", "<CMD>vertical resize -5<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-Down>", "<CMD>resize +5<CR>", { noremap = true, silent = true })

-- Session
keymap.set("n", "<Leader>ss", ":SSave<Space>", { noremap = true, silent = true })
keymap.set("n", "<Leader>sl", ":SLoad<Space>", { noremap = true, silent = true })
keymap.set("n", "<Leader>sc", "<CMD>SClose<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>sd", "<CMD>SDelete<CR>", { noremap = true, silent = true })

-- File Tree
keymap.set("n", "<Leader>n", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = false })

-- Telescope
keymap.set(
  "n",
  "<Leader>.",
  '<CMD>lua require("telescope.builtin").file_browser()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fa",
  '<CMD>lua require("telescope.builtin").autocommands()<CR>',
  { noremap = true, silent = false }
)
keymap.set("n", "<Leader>fb", '<CMD>lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = false })
keymap.set(
  "n",
  "<Leader>fc",
  '<CMD>lua require("telescope.builtin").git_commits()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>ff",
  '<CMD>lua require("telescope.builtin").find_files()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fg",
  '<CMD>lua require("telescope.builtin").git_bcommits()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fh",
  '<CMD>lua require("telescope.builtin").oldfiles()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fH",
  '<CMD>lua require("telescope.builtin").command_history()<CR>',
  { noremap = true, silent = false }
)
keymap.set("n", "<Leader>fl", '<CMD>lua require("telescope.builtin").loclist()<CR>', { noremap = true, silent = false })
keymap.set(
  "n",
  "<Leader>fL",
  "<CMD>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>",
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fm",
  '<CMD>lua require("telescope.builtin").man_pages()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fp",
  '<CMD>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fP",
  '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fd",
  '<CMD>lua require("telescope.builtin").diagnostics()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fq",
  '<CMD>lua require("telescope.builtin").quickfix()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>fr",
  '<CMD>lua require("telescope.builtin").live_grep()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>ft",
  '<CMD>lua require("telescope.builtin").treesitter()<CR>',
  { noremap = true, silent = false }
)
keymap.set(
  "n",
  "<Leader>gf",
  '<CMD>lua require("telescope.builtin").git_branches()<CR>',
  { noremap = true, silent = false }
)
keymap.set("n", "<Leader>fT", "<CMD>TodoTelescope<CR>", { noremap = true, silent = false })

-- Git
keymap.set("n", "<Leader>gB", "<CMD>GBrowse<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gD", "<CMD>Gvdiffsplit<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gL", "<CMD>Gclog<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gb", "<CMD>Git blame<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gg", "<CMD>Flogsplit<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gj", "<CMD>diffget //2<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gk", "<CMD>diffget //3<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gl", "<CMD>Git log<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>gm", ":Git merge ", { noremap = true, silent = false })
-- keymap.set{'n', '<Leader>gn', '<CMD>Neogit<CR>', {noremap = true, silent = false}},
keymap.set("n", "<Leader>gp", ":Git push ", { noremap = true, silent = false })
keymap.set("n", "<Leader>gP", ":Git pull ", { noremap = true, silent = false })
keymap.set("n", "<Leader>gs", "<CMD>G<CR>", { noremap = true, silent = false })

--- Gist
keymap.set({ "n", "v" }, "<Leader>Gg", "<CMD>Gist<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>Gp", "<CMD>Gist -p<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>Ga", "<CMD>Gist -a<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>Gm", "<CMD>Gist -m<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>Ge", "<CMD>Gist -e<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>Gd", "<CMD>Gist -d<CR>", { noremap = true, silent = false })
keymap.set("n", "<Leader>Gl", "<CMD>Gist -l<CR>", { noremap = true, silent = false })

-- Tags
keymap.set("n", "<Leader>t", "<CMD>AerialToggle<CR>", { noremap = true, silent = false })

-- Cheatsheet
keymap.set("n", "<Leader>ah", "<CMD>Cheat<CR>", { noremap = true, silent = false })

-- File Manager
keymap.set("n", "<Leader>v", "<CMD>Vifm<CR>", { noremap = true, silent = false })

-- Maximizing Pane
keymap.set("n", "<Leader>m", "<CMD>lua MiniMisc.zoom()<CR>", { noremap = true, silent = false })

-- LSP
keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { noremap = true, silent = true })
keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { noremap = true, silent = true })
keymap.set(
  "n",
  "<space>wl",
  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  { noremap = true, silent = true }
)
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>aL", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { noremap = true, silent = true })
keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

keymap.set("n", "[d", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
keymap.set("n", "]d", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
keymap.set("n", "rn", "<CMD>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>r", "<CMD>lua vim.lsp.buf.format{ async = true }<CR>", { noremap = true, silent = true })
keymap.set("v", "<Leader>r", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>ls", ":LspStart ", { noremap = true, silent = true })
keymap.set("n", "<leader>ln", "<CMD>LspStop<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>lr", "<CMD>LspRestart<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>li", "<CMD>LspInfo<CR>", { noremap = true, silent = true })

--debugging
keymap.set("n", "<leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>di", "<CMD>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>do", "<CMD>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>dc", "<CMD>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>dp", "<CMD>lua require'dap'.reverse_continue()<CR>", { noremap = true, silent = true })
keymap.set(
  "n",
  "<leader>df",
  "<CMD>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { noremap = true, silent = true }
)
keymap.set("n", "<leader>dr", "<CMD>lua require'dap'.run_last()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>dR", "<CMD>lua require'dap'.run_to_cursor()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>dt", "<CMD>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>dF", "<CMD>lua require'dapui'.float_element()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>de", "<CMD>lua require'dapui'.eval()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>dx", "<CMD>lua require'dapui'.terminate()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>dq", "<CMD>lua require'dap'.list_breakpoints()<CR>", { noremap = true, silent = true })

-- Formatter
keymap.set({ "n", "v" }, "<leader>R", "<CMD>Format<CR>", { noremap = true, silent = true })

-- mini.nvim
--- Buffer
-- keymap.set( 'n', '<Leader>qd', '<CMD>bd<CR>', {noremap = true, silent = true} )
-- keymap.set( 'n', '<Leader>qf', '<CMD>bd!<CR>', {noremap = true, silent = true} )
-- keymap.set( 'n', '<Leader>qq', '<CMD>bufdo bd<CR>', {noremap = true, silent = true} )
-- keymap.set( 'n', '<Leader>qa', '<CMD>bufdo bd!<CR>', {noremap = true, silent = true} )
-- keymap.set( 'n', '<Leader>qo', '<CMD>%bdelete|edit #|normal \'\"<CR>', {noremap = true, silent = true} )
keymap.set({ "n", "v" }, "<leader>qd", "<CMD>lua MiniBufremove.delete()<CR>", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "<leader>qD", "<CMD>lua MiniBufremove.delete(0, true)<CR>", { noremap = true, silent = true })
--- Surround
-- Remap adding surrounding to Visual mode selection
keymap.set("x", "S", "lua MiniSurround.add('visual')<CR>", { noremap = true })
-- Make special mapping for "add surrounding for line"
keymap.set("n", "yss", "ys_", { noremap = false })
