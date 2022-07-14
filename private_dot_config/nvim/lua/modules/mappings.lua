local keymap = vim.keymap

-- Disable keys
keymap.set("n", "Q", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-z>", "<Nop>", { noremap = true, silent = true })

-- Tabs
keymap.set(
  "n",
  "<Leader>ta",
  "<CMD>tab split<CR>",
  { noremap = true, silent = false, desc = "Open current in new tab" }
)
keymap.set("n", "<Leader>tc", "<CMD>tabclose<CR>", { noremap = true, silent = false, desc = "Close tab" })
keymap.set(
  "n",
  "<Leader>to",
  "<CMD>tabonly<CR>",
  { noremap = true, silent = false, desc = "Close all but current tab" }
)
keymap.set("n", "<Leader>tmp", "<CMD>-tabmove<CR>", { noremap = true, silent = false, desc = "Move tab to previous" })
keymap.set("n", "<Leader>tmn", "<CMD>+tabmove<CR>", { noremap = true, silent = false, desc = "Move tab to next" })

-- Sourcing
keymap.set(
  "n",
  "<Leader>as",
  "<CMD>WriteAndReload<CR>",
  { noremap = true, silent = false, desc = "Write and reload with current file setting" }
)

-- Find file Root
keymap.set(
  "n",
  "<Leader>aw",
  "<CMD>lcd %:p:h | cd .<CR>",
  { noremap = true, silent = false, desc = "To current folder" }
)
keymap.set(
  "n",
  "<Leader>aj",
  "<CMD>Rooter | cd .<CR>",
  { noremap = true, silent = false, desc = "To currend directory root" }
)

-- Misc Things
keymap.set("t", "<ESC><ESC>", "<c-\\><c-n>", { noremap = true, silent = false, desc = "" })
keymap.set("n", "<ESC><ESC>", "<CMD>nohlsearch<CR>", { noremap = true, silent = false, desc = "" })

keymap.set("n", "<Leader>aC", "<CMD>!compiler %<CR>", { noremap = true, silent = false, desc = "Compile file" })
keymap.set(
  "n",
  "<Leader>aD",
  "<CMD>DBUIToggle<CR>",
  { noremap = true, silent = false, desc = "Open dad-bod for database" }
)
keymap.set(
  "n",
  "<Leader>ae",
  "<CMD>setlocal spell! spelllang=en_gb complete+=kspell<CR>",
  { noremap = true, silent = false, desc = "Spellcheck English" }
)
keymap.set("n", "<Leader>af", "<CMD>call DiffToggle()<CR>", { noremap = true, silent = false, desc = "Toggle diff" })
keymap.set(
  "n",
  "<Leader>ai",
  "<CMD>setlocal spell! spelllang=id_id complete+=kspell<CR>",
  { noremap = true, silent = false, desc = "Spellcheck Indonesia" }
)
keymap.set("n", "<Leader>ap", "<CMD>!opout %<CR>", { noremap = true, silent = false, desc = "View compiled output" })
keymap.set("n", "<Leader>aq", "<CMD>copen<CR>", { noremap = true, silent = false, desc = "Open quickfixlist" })
keymap.set("n", "<Leader>al", "<CMD>lopen<CR>", { noremap = true, silent = false, desc = "Open loclist" })
keymap.set(
  "n",
  "<Leader>ax",
  "<CMD>TroubleToggle workspace_diagnostics<CR>",
  { noremap = true, silent = false, desc = "Show lsp diagnostic" }
)
keymap.set("n", "<Leader>aX", "<CMD>TodoTrouble<CR>", { noremap = true, silent = false, desc = "Show TODOs" })
keymap.set(
  "n",
  "<Leader>aQ",
  "<CMD>lua require('rest-nvim').run()<CR>",
  { noremap = true, silent = false, desc = "Run http request" }
)
keymap.set(
  "n",
  "<Leader>aT",
  "<CMD>call TrimWhitespace()<CR>",
  { noremap = true, silent = false, desc = "Trim Whitespace" }
)
keymap.set("n", "<Leader>aN", "<CMD>NeorgStart<CR>", { noremap = true, silent = false, desc = "Start Neorg" })
keymap.set("x", "gl", ":EasyAlign<CR>", { noremap = true, silent = false, desc = "" })
keymap.set("n", "gl", ":EasyAlign<CR>", { noremap = true, silent = false, desc = "" })
keymap.set("x", "gL", ":LiveEasyAlign<CR>", { noremap = true, silent = false, desc = "" })
keymap.set("n", "gL", ":LiveEasyAlign<CR>", { noremap = true, silent = false, desc = "" })

-- Colorizer
keymap.set("n", "<Leader>ac", "<CMD>ColorizerToggle<CR>", { noremap = true, silent = false, desc = "Colorizer" })

-- Undo tree
keymap.set("n", "<Leader>au", "<CMD>UndotreeToggle<CR>", { noremap = true, silent = false, desc = "Undo tree" })

-- Document generate
keymap.set("n", "<Leader>ad", ":Neogen ", { noremap = true, silent = false, desc = "Generate docs" })

-- Resizing Panes
keymap.set("n", "<C-Left>", "<CMD>vertical resize +5<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "<C-Up>", "<CMD>resize -5<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "<C-Right>", "<CMD>vertical resize -5<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "<C-Down>", "<CMD>resize +5<CR>", { noremap = true, silent = true, desc = "" })

-- Session
keymap.set("n", "<Leader>ss", ":SSave<Space>", { noremap = true, silent = true, desc = "Save sesion" })
keymap.set("n", "<Leader>sl", ":SLoad<Space>", { noremap = true, silent = true, desc = "Load session" })
keymap.set("n", "<Leader>sc", "<CMD>SClose<CR>", { noremap = true, silent = true, desc = "Close session" })
keymap.set("n", "<Leader>sd", "<CMD>SDelete<CR>", { noremap = true, silent = true, desc = "Delete sesion" })

-- File Tree
keymap.set("n", "<Leader>n", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = false, desc = "File tree" })

-- Telescope
keymap.set(
  "n",
  "<Leader>fH",
  '<CMD>lua require("telescope.builtin").command_history()<CR>',
  { noremap = true, silent = false, desc = "Command history" }
)
keymap.set(
  "n",
  "<Leader>fL",
  "<CMD>lua require('telescope.builtin').find_files({hidden=true})<CR>",
  { noremap = true, silent = false, desc = "Hidden files" }
)
keymap.set(
  "n",
  "<Leader>fM",
  '<CMD>lua require("telescope.builtin").man_pages()<CR>',
  { noremap = true, silent = false, desc = "Hidden files" }
)
keymap.set(
  "n",
  "<Leader>fP",
  '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>',
  { noremap = true, silent = false, desc = "Document symbols" }
)
keymap.set("n", "<Leader>fT", "<CMD>TodoTelescope<CR>", { noremap = true, silent = false, desc = "Look todos" })
keymap.set(
  "n",
  "<Leader>fW",
  "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  { noremap = true, silent = false, desc = "Navigate worktree" }
)
keymap.set(
  "n",
  "<Leader>fb",
  '<CMD>lua require("telescope.builtin").buffers()<CR>',
  { noremap = true, silent = false, desc = "Buffers" }
)
keymap.set(
  "n",
  "<Leader>fc",
  '<CMD>lua require("telescope.builtin").git_commits()<CR>',
  { noremap = true, silent = false, desc = "Git Commits" }
)
keymap.set(
  "n",
  "<Leader>fd",
  '<CMD>lua require("telescope.builtin").diagnostics()<CR>',
  { noremap = true, silent = false, desc = "Workspace diagnostic" }
)
keymap.set(
  "n",
  "<Leader>ff",
  '<CMD>lua require("telescope.builtin").find_files()<CR>',
  { noremap = true, silent = false, desc = "Files" }
)
keymap.set(
  "n",
  "<Leader>fg",
  '<CMD>lua require("telescope.builtin").git_bcommits()<CR>',
  { noremap = true, silent = false, desc = "Buffer commits" }
)
keymap.set(
  "n",
  "<Leader>fh",
  '<CMD>lua require("telescope.builtin").oldfiles()<CR>',
  { noremap = true, silent = false, desc = "File history" }
)
keymap.set(
  "n",
  "<Leader>fl",
  '<CMD>lua require("telescope.builtin").loclist()<CR>',
  { noremap = true, silent = false, desc = "Loclist" }
)
keymap.set(
  "n",
  "<Leader>fp",
  '<CMD>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',
  { noremap = true, silent = false, desc = "Workspace symbols" }
)
keymap.set(
  "n",
  "<Leader>fq",
  '<CMD>lua require("telescope.builtin").quickfix()<CR>',
  { noremap = true, silent = false, desc = "Quickfix" }
)
keymap.set(
  "n",
  "<Leader>fr",
  '<CMD>lua require("telescope.builtin").live_grep()<CR>',
  { noremap = true, silent = false, desc = "Ripgrep" }
)
keymap.set(
  "n",
  "<Leader>ft",
  '<CMD>lua require("telescope.builtin").treesitter()<CR>',
  { noremap = true, silent = false, desc = "Treesitter" }
)
keymap.set(
  "n",
  "<Leader>fw",
  "<CMD>Telescope neorg switch_workspace<CR>",
  { noremap = true, silent = false, desc = "Neorg workspaces" }
)

-- Git
keymap.set("n", "<Leader>gB", "<CMD>GBrowse<CR>", { noremap = true, silent = false, desc = "Open file in remote repo" })
keymap.set(
  "n",
  "<Leader>gD",
  "<CMD>Gvdiffsplit<CR>",
  { noremap = true, silent = false, desc = "Git diff current file" }
)
keymap.set("n", "<Leader>gL", "<CMD>Gclog<CR>", { noremap = true, silent = false, desc = "Git commit log" })
keymap.set("n", "<Leader>gb", "<CMD>Git blame<CR>", { noremap = true, silent = false, desc = "Git blame" })
keymap.set(
  "n",
  "<Leader>gg",
  "<CMD>Git log --oneline --decorate --graph --all<CR>",
  { noremap = true, silent = false, desc = "Commits graph" }
)
keymap.set("n", "<Leader>gj", "<CMD>diffget //2<CR>", { noremap = true, silent = false, desc = "Get left" })
keymap.set("n", "<Leader>gk", "<CMD>diffget //3<CR>", { noremap = true, silent = false, desc = "Get right" })
keymap.set("n", "<Leader>gl", "<CMD>Git log<CR>", { noremap = true, silent = false, desc = "Git log" })
keymap.set("n", "<Leader>gm", ":Git merge ", { noremap = true, silent = false, desc = "Git merge" })
keymap.set("n", "<Leader>gp", ":Git push ", { noremap = true, silent = false, desc = "Git push" })
keymap.set("n", "<Leader>gP", ":Git pull ", { noremap = true, silent = false, desc = "Git pull" })
keymap.set("n", "<Leader>gr", ":Git reset  ", { noremap = true, silent = false, desc = "Git reset" })
keymap.set("n", "<Leader>gR", ":Git revert  ", { noremap = true, silent = false, desc = "Git revert" })
keymap.set("n", "<Leader>gs", "<CMD>G<CR>", { noremap = true, silent = false, desc = "Git status" })
keymap.set(
  "n",
  "<Leader>gW",
  "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
  { noremap = true, silent = false, desc = "Create Worktree" }
)

--- Gist
keymap.set({ "n", "v" }, "<Leader>Gg", "<CMD>Gist<CR>", { noremap = true, silent = false, desc = "Create a gist" })
keymap.set("n", "<Leader>Gp", "<CMD>Gist -p<CR>", { noremap = true, silent = false, desc = "Create a private gist" })
keymap.set(
  "n",
  "<Leader>Ga",
  "<CMD>Gist -a<CR>",
  { noremap = true, silent = false, desc = "Create a gist anonymously" }
)
keymap.set(
  "n",
  "<Leader>Gm",
  "<CMD>Gist -m<CR>",
  { noremap = true, silent = false, desc = "Crete a gist will all buffers" }
)
keymap.set("n", "<Leader>Ge", "<CMD>Gist -e<CR>", { noremap = true, silent = false, desc = "Edit current file gist" })
keymap.set("n", "<Leader>Gd", "<CMD>Gist -d<CR>", { noremap = true, silent = false, desc = "Delete gist" })
keymap.set("n", "<Leader>Gl", "<CMD>Gist -l<CR>", { noremap = true, silent = false, desc = "Gist list" })

-- Tags
keymap.set("n", "<Leader>at", "<CMD>AerialToggle<CR>", { noremap = true, silent = false, desc = "Tagbar" })

-- File Manager
keymap.set("n", "<Leader>v", "<CMD>Vifm<CR>", { noremap = true, silent = false, desc = "File manager" })

-- Maximizing Pane
keymap.set("n", "<Leader>am", "<CMD>lua MiniMisc.zoom()<CR>", { noremap = true, silent = false, desc = "Maximizer" })

-- LSP
keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set(
  "n",
  "<space>wa",
  "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
  { noremap = true, silent = true, desc = "" }
)
keymap.set(
  "n",
  "<space>wr",
  "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
  { noremap = true, silent = true, desc = "" }
)
keymap.set(
  "n",
  "<space>wl",
  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  { noremap = true, silent = true }
)
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true, desc = "" })

keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set("n", "rn", "<CMD>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "" })
keymap.set(
  "n",
  "<Leader>r",
  "<CMD>lua vim.lsp.buf.format{ async = true }<CR>",
  { noremap = true, silent = true, desc = "Format file" }
)
keymap.set(
  "v",
  "<Leader>r",
  "<CMD>lua vim.lsp.buf.range_formatting()<CR>",
  { noremap = true, silent = true, desc = "" }
)
keymap.set("n", "<leader>ls", ":LspStart ", { noremap = true, silent = true, desc = "Start LSP <name>" })
keymap.set("n", "<leader>ln", "<CMD>LspStop<CR>", { noremap = true, silent = true, desc = "Stop LSP" })
keymap.set("n", "<leader>lr", "<CMD>LspRestart<CR>", { noremap = true, silent = true, desc = "Info LSP" })
keymap.set("n", "<leader>li", "<CMD>LspInfo<CR>", { noremap = true, silent = true, desc = "Restart LSP" })

--debugging
keymap.set(
  "n",
  "<leader>db",
  "<CMD>lua require'dap'.toggle_breakpoint()<CR>",
  { noremap = true, silent = true, desc = "Toggle breakpoint" }
)
keymap.set(
  "n",
  "<leader>di",
  "<CMD>lua require'dap'.step_into()<CR>",
  { noremap = true, silent = true, desc = "Step into" }
)
keymap.set(
  "n",
  "<leader>do",
  "<CMD>lua require'dap'.step_out()<CR>",
  { noremap = true, silent = true, desc = "Step out" }
)
keymap.set(
  "n",
  "<leader>dc",
  "<CMD>lua require'dap'.continue()<CR>",
  { noremap = true, silent = true, desc = "Continue" }
)
keymap.set(
  "n",
  "<leader>dp",
  "<CMD>lua require'dap'.reverse_continue()<CR>",
  { noremap = true, silent = true, desc = "Reverse continue" }
)
keymap.set(
  "n",
  "<leader>df",
  "<CMD>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { noremap = true, silent = true, desc = "Toggle breakpoint with condition" }
)
keymap.set(
  "n",
  "<leader>dr",
  "<CMD>lua require'dap'.run_last()<CR>",
  { noremap = true, silent = true, desc = "Run last debug settings" }
)
keymap.set(
  "n",
  "<leader>dR",
  "<CMD>lua require'dap'.run_to_cursor()<CR>",
  { noremap = true, silent = true, desc = "Run until cursor" }
)
keymap.set(
  "n",
  "<leader>dt",
  "<CMD>lua require'dapui'.toggle()<CR>",
  { noremap = true, silent = true, desc = "Toggle debug UI" }
)
keymap.set(
  "n",
  "<leader>dF",
  "<CMD>lua require'dapui'.float_element()<CR>",
  { noremap = true, silent = true, desc = "Toggle float" }
)
keymap.set(
  "n",
  "<leader>de",
  "<CMD>lua require'dapui'.eval()<CR>",
  { noremap = true, silent = true, desc = "Evaluate" }
)
keymap.set(
  "n",
  "<leader>dx",
  "<CMD>lua require'dapui'.terminate()<CR>",
  { noremap = true, silent = true, desc = "Terimate" }
)
keymap.set(
  "n",
  "<leader>dq",
  "<CMD>lua require'dap'.list_breakpoints()<CR>",
  { noremap = true, silent = true, desc = "Send breakpoints to quickfix" }
)

-- Formatter
keymap.set({ "n", "v" }, "<leader>R", "<CMD>Neoformat<CR>", { noremap = true, silent = true, desc = "" })

-- Harpoon
keymap.set(
  "n",
  "<leader>mf",
  "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>",
  { noremap = true, silent = true, desc = "Harpoon control" }
)
keymap.set(
  "n",
  "<leader>ma",
  "<CMD>lua require('harpoon.mark').add_file()<CR>",
  { noremap = true, silent = true, desc = "Add file to Harpoon" }
)
keymap.set(
  "n",
  "<leader>mn",
  "<CMD>lua require('harpoon.ui').nav_next()<CR>",
  { noremap = true, silent = true, desc = "Previous Harpoon" }
)
keymap.set(
  "n",
  "<leader>ml",
  "<CMD>lua require('harpoon.ui').nav_prev()<CR>",
  { noremap = true, silent = true, desc = "Next Harpoon" }
)

-- Neotest
keymap.set(
  "n",
  "<leader>Tn",
  "<CMD>lua require('neotest').run.run() <CR>",
  { noremap = true, silent = true, desc = "Run nearest test" }
)
keymap.set(
  "n",
  "<leader>Tb",
  "<CMD>lua require('neotest').run.stop() <CR>",
  { noremap = true, silent = true, desc = "Stop nearest test running" }
)
keymap.set(
  "n",
  "<leader>To",
  "<CMD>lua require('neotest').output.open() <CR>",
  { noremap = true, silent = true, desc = "Show unit test" }
)
keymap.set(
  "n",
  "<leader>Ts",
  "<CMD>lua require('neotest').summary.toggle() <CR>",
  { noremap = true, silent = true, desc = "Show test summary" }
)
keymap.set(
  "n",
  "<leader>Tf",
  "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { noremap = true, silent = true, desc = "Run test for current file" }
)
keymap.set(
  "n",
  "<leader>Tp",
  "<CMD>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
  { noremap = true, silent = true, desc = "Run test for whole project" }
)

-- mini.nvim
--- Buffer
keymap.set(
  { "n", "v" },
  "<leader>qd",
  "<CMD>lua MiniBufremove.delete()<CR>",
  { noremap = true, silent = true, desc = "Close buffer" }
)
keymap.set(
  { "n", "v" },
  "<leader>qD",
  "<CMD>lua MiniBufremove.delete(0, true)<CR>",
  { noremap = true, silent = true, desc = "Close buffer force" }
)
--- Surround
-- Remap adding surrounding to Visual mode selection
keymap.set("x", "S", "lua MiniSurround.add('visual')<CR>", { noremap = true, desc = "" })
-- Make special mapping for "add surrounding for line"
keymap.set("n", "yss", "ys_", { noremap = false, desc = "" })
