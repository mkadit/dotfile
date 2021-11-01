local keymap = vim.api.nvim_set_keymap

local function set_keybindings()
    local opts = {noremap = true, silent = true}

    local keybindings = {
        -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}

        -- Disable Keys
        {'n', 'Q', '<Nop>', {noremap = true, silent = true}},
        {'n', '<C-z>', '<Nop>', {noremap = true, silent = true}},

        -- Traverse and sourcing
        -- {'n', '<Leader>as', '<CMD>luafile ~/.config/nvim/init.lua<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>as', '<CMD>e ~/.config/nvim/init.lua<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ar', '<CMD>Restart<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>aR', '<CMD>Reload<CR>', {noremap = true, silent = false}},

        -- Find file Root
        {'n', '<Leader>aw', '<CMD>lcd %:p:h<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>aj', '<CMD>Rooter<CR>', {noremap = true, silent = false}},
        -- Misc Things
        {'t', '<ESC><ESC>', '<c-\\><c-n>', {noremap = true, silent = false}},
        {'n', '<ESC><ESC>', '<CMD>nohlsearch<CR>', {noremap = true, silent = false}},
        {'n', '<C-\\>', '<CMD>call ToggleTerm()<CR>', {noremap = true, silent = false}},
        {'t', '<C-\\>', '<CMD>call ToggleTerm()<CR>', {noremap = true, silent = false}},

        {'n', '<Leader>aC', '<CMD>!compiler %<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>aD', '<CMD>DBUIToggle<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ae', '<CMD>setlocal spell! spelllang=en_gb complete+=kspell<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>af', '<CMD>call DiffToggle()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ai', '<CMD>setlocal spell! spelllang=id_id complete+=kspell<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ap', '<CMD>!opout %<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>aq', '<CMD>copen<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>al', '<CMD>lopen<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ax', '<CMD>LspTroubleToggle<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>aX', '<CMD>TodoTrouble<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>aQ', "<CMD>lua require('rest-nvim').run()<CR>", {noremap = true, silent = false}},
        {'n', '<Leader>at', "<CMD>call TrimWhitespace()<CR>", {noremap = true, silent = false}},
        {'x', 'gl', ":EasyAlign<CR>", {noremap = true, silent = false}},
        {'n', 'gl', ":EasyAlign<CR>", {noremap = true, silent = false}},
        {'x', 'gL', ":LiveEasyAlign<CR>", {noremap = true, silent = false}},
        {'n', 'gL', ":LiveEasyAlign<CR>", {noremap = true, silent = false}},

		-- Colorizer
        {'n', '<Leader>ac', '<CMD>ColorizerToggle<CR>', {noremap = true, silent = false}},

		-- Undo tree
        {'n', '<Leader>au', '<CMD>UndotreeToggle<CR>', {noremap = true, silent = false}},

		-- Document generate
        {'n', '<Leader>ad', '<CMD>DogeGenerate<CR>', {noremap = true, silent = false}},

        -- Resizing Panes
        {'n', '<C-Left>', '<CMD>vertical resize +5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Up>', '<CMD>resize -5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Right>', '<CMD>vertical resize -5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Down>', '<CMD>resize +5<CR>', {noremap = true, silent = true}},

        -- Session
        {'n', '<Leader>ss', ':SSave<Space>', {noremap = true, silent = true}},
        {'n', '<Leader>sl', ':SLoad<Space>', {noremap = true, silent = true}},
        {'n', '<Leader>sc', '<CMD>SClose<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>sd', '<CMD>SDelete<CR>', {noremap = true, silent = true}},

        -- Buffers
        {'n', '<Leader>qd', '<CMD>bd<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>qf', '<CMD>bd!<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>qq', '<CMD>bufdo bd<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>qa', '<CMD>bufdo bd!<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>qo', '<CMD>%bdelete|edit #|normal \'\"<CR>', {noremap = true, silent = true}},

        -- File Tree
        {'n', '<Leader>n', '<CMD>NvimTreeToggle<CR>', {noremap = true, silent = false}},

        -- Telescope
        {'n', '<Leader>.', '<CMD>lua require("telescope.builtin").file_browser()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fa', '<CMD>lua require("telescope.builtin").autocommands()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fc', '<CMD>lua require("telescope.builtin").commits()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fg', '<CMD>lua require("telescope.builtin").bcommits()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fh', '<CMD>lua require("telescope.builtin").oldfiles()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fH', '<CMD>lua require("telescope.builtin").command_history()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fl', '<CMD>lua require("telescope.builtin").loclist()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fL', '<CMD>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fm', '<CMD>lua require("telescope").extensions.media_files.media_files()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fp', '<CMD>lua require("telescope.builtin.lsp").dynamic_workspace_symbols()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fd', '<CMD>lua require("telescope.builtin.lsp").workspace_diagnostics()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fq', '<CMD>lua require("telescope.builtin").quickfix()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fr', '<CMD>lua require("telescope.builtin").live_grep()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ft', '<CMD>lua require("telescope.builtin").treesitter()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gf', '<CMD>lua require("telescope.builtin").git_branches()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fT', '<CMD>TodoTelescope<CR>', {noremap = true, silent = false}},

        -- Git
        {'n', '<Leader>gB', '<CMD>GBrowse<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gD', '<CMD>Gvdiffsplit<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gL', '<CMD>Gclog<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gb', '<CMD>Git blame<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gg', '<CMD>Flogsplit<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gj', '<CMD>diffget //2<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gk', '<CMD>diffget //3<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gl', '<CMD>Git log<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gm', '<CMD>Git merge', {noremap = true, silent = false}},
        -- {'n', '<Leader>gn', '<CMD>Neogit<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gp', '<CMD>Git push', {noremap = true, silent = false}},
        {'n', '<Leader>gs', '<CMD>G<CR>', {noremap = true, silent = false}},

        --- Gist
        {'n', '<Leader>Gg', '<CMD>Gist<CR>', {noremap = true, silent = false}},
        {'v', '<Leader>Gg', "<CMD>'<,'>Gist<CR>", {noremap = true, silent = false}},
        {'n', '<Leader>Gp', '<CMD>Gist -p<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>Ga', '<CMD>Gist -a<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>Gm', '<CMD>Gist -m<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>Ge', '<CMD>Gist -e<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>Gd', '<CMD>Gist -d<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>Gl', '<CMD>Gist -l<CR>', {noremap = true, silent = false}},


        -- Tags
        {'n', '<Leader>t', '<CMD>Vista!!<CR>', {noremap = true, silent = false}},

        -- Cheatsheet
        {'n', '<Leader>ah', '<CMD>Cheat<CR>', {noremap = true, silent = false}},

        -- File Manager
        {'n', '<Leader>v', '<CMD>Vifm<CR>', {noremap = true, silent = false}},

        -- Maximizing Pane
        {'n', '<Leader>m', '<CMD>TZFocus<CR>', {noremap = true, silent = false}},

        -- LSP
        {'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts},
        {'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts}, {'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts},
        {'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts},
        {'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts},
        {'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts},
        {'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts},
        {'n', '<Leader>aL', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts},
        {'n', 'K', '<CMD>lua show_documentation()<CR>', {noremap = true, silent = true}},
        {'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts},

        {'n', '[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true}},
        {'n', ']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true}},
        {'n', 'rn', '<CMD>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>r', '<CMD>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true}},
        {'v', '<Leader>r', '<CMD>lua vim.lsp.buf.range_formatting()<CR>', {noremap = true, silent = true}},
        {'n', '<leader>ls', ':LspStart ', {noremap = true, silent = true}},
        {'n', '<leader>ln', '<CMD>LspStop<CR>', {noremap = true, silent = true}},
        {'n', '<leader>lr', '<CMD>LspRestart<CR>', {noremap = true, silent = true}},
        {'n', '<leader>li', '<CMD>LspInfo<CR>', {noremap = true, silent = true}},

		--debugging
        {'n', '<leader>db', "<CMD>lua require'dap'.toggle_breakpoint()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>di', "<CMD>lua require'dap'.step_into()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>do', "<CMD>lua require'dap'.step_out()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dc', "<CMD>lua require'dap'.continue()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dp', "<CMD>lua require'dap'.reverse_continue()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>df', "<CMD>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dr', "<CMD>lua require'dap'.run_last()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dR', "<CMD>lua require'dap'.run_to_cursor()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dt', "<CMD>lua require'dapui'.toggle()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dF', "<CMD>lua require'dapui'.float_element()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>de', "<CMD>lua require'dapui'.eval()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dx', "<CMD>lua require'dapui'.terminate()<CR>", {noremap = true, silent = true}},
        {'n', '<leader>dq', "<CMD>lua require'dap'.list_breakpoints()<CR>", {noremap = true, silent = true}},

        -- Formatter
        {'n', '<leader>R', '<CMD>Format<CR>', {noremap = true, silent = true}},
        {'v', '<leader>R', '<CMD>Format<CR>', {noremap = true, silent = true}},

    }
    function _G.show_documentation()
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
            vim.cmd('h ' .. vim.fn.expand('<cword>'))
        else
            vim.cmd('lua vim.lsp.buf.hover()')
        end
    end

    for _, key in pairs(keybindings) do keymap(key[1], key[2], key[3], key[4]) end
end
vim.cmd('let mapleader=" "')
set_keybindings()
