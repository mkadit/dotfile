local Util = require("util")
local Config = require("config")

return {

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("util").root.get() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.loop.cwd(),
          })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer explorer",
      },
      {
        "<leader>fn",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer explorer",
      },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = false },
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = "disabled",
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["Y"] = function(state)
            local node = state.tree:get_node()
            local content = node.path
            -- relative
            -- local content = node.path:gsub(state.path, ""):sub(2)
            vim.fn.setreg('"', content)
            vim.fn.setreg("1", content)
            vim.fn.setreg("+", content)
          end,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
    config = function(_, opts)
      local function on_move(data)
        Util.lsp.on_rename(data.source, data.destination)
      end

      local events = require("neo-tree.events")
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    -- event = "VeryLazy",
    opts = {},
  },

  -- search/replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- fuzzy finder
  -- The default key bindings to find files will use Telescope's
  -- `find_files` or `git_files` depending on whether the
  -- directory is a git repo.
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        "debugloop/telescope-undo.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("fzf")
          end)
        end,
      },
    },
    keys = {
      { "<leader>f,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      -- { "<leader>fr", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fC", Util.telescope.config_files(), desc = "Find Config (nvim)" },
      { "<leader>fc", "<cmd>Telescope config_pick<cr>", desc = "Find Config" },
      { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      -- git
      -- { "<leader>fS", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>fs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader>sA", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
      { "<leader>sQ", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
      {
        "<leader>uC",
        Util.telescope("colorscheme", {
          enable_preview = true,
        }),
        desc = "Colorscheme with preview",
      },
      {
        "<leader>ss",
        function()
          require("telescope.builtin").lsp_document_symbols({
            symbols = require("config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols({
            symbols = require("config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },

      { "<leader>au", "<cmd>Telescope undo<cr>", desc = "Undo tree" },
    },
    opts = function()
      local actions = require("telescope.actions")

      local open_with_trouble = function(...)
        return require("trouble.providers.telescope").open_with_trouble(...)
      end
      local open_selected_with_trouble = function(...)
        return require("trouble.providers.telescope").open_selected_with_trouble(...)
      end
      local find_files_no_ignore = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        Util.telescope("find_files", { no_ignore = true, default_text = line })()
      end
      local find_files_with_hidden = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        Util.telescope("find_files", { hidden = true, default_text = line })()
      end

      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ["<c-h>"] = open_with_trouble,
              ["<a-t>"] = open_selected_with_trouble,
              ["<a-i>"] = find_files_no_ignore,
              ["<a-h>"] = find_files_with_hidden,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-q>"] = actions.send_to_qflist,
              ["<C-w>"] = actions.send_selected_to_qflist,
              ["<C-e>"] = actions.delete_buffer,
              ["<C-t>"] = actions.select_tab,
              ["<C-k>"] = actions.which_key,
              -- ["<C-f>"] = actions.preview_scrolling_down,
              -- ["<C-b>"] = actions.preview_scrolling_up,

              ["<C-s>"] = function(prompt_buf)
                --- Quickfix history settings
                local action_state = require("telescope.actions.state")
                local entry = action_state.get_selected_entry()
                actions.close(prompt_buf)
                vim.cmd(string.format("%schistory | copen", entry.nr))
              end,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
      }
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      plugins = { spelling = true },
      spec = {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>a", group = "action" },
        { "<leader>ao", group = "runner" },
        { "<leader>at", group = "terminal" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>cl", group = "lsp" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gS", group = "gist" },
        { "<leader>gh", group = "hunks" },
        { "<leader>gw", group = "worktrees" },
        { "<leader>m", group = "harpoon" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>sn", group = "noice" },
        { "<leader>t", group = "test" },
        { "<leader>u", group = "ui" },
        { "<leader>w", group = "windows" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "cs", group = "surround" },
        { "g", group = "goto" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add(opts.spec)
    end,
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, "Next Diff")

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, "Prev Diff")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function()
          gs.blame_line({ full = true })
        end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function()
          gs.diffthis("~")
        end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  -- diff
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",

    keys = {
      { "<leader>gdo", ":DiffviewOpen ", desc = "Diff Against Branch" },
      { "<leader>gdr", "<cmd>DiffviewFileHistory<cr>", desc = "Diff Repo History" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory --follow %<cr>", desc = "Diff File Git History" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory --follow<cr>", desc = "Diff Line Git History", mode = { "v" } },
      { "<leader>gdc", "<cmd>DiffviewClose", desc = "Close Diff" },
    },
  },

  -- Automatically highlights other instances of the word under your cursor.
  -- This works with LSP, Treesitter, and regexp matching to find the other
  -- instances.
  {
    "RRethy/vim-illuminate",
    event = "LazyFile",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    event = "VeryLazy",
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
      -- stylua: ignore
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },

  -- Finds and lists all of the TODO, HACK, BUG, etc comment
  -- in your project and loads them into a browsable list.
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "LazyFile",
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },

  -- Toggle Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>atv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle terminal vertical" },
      { "<leader>atf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal float" },
      { "<leader>ats", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle terminal horizontal" },
    },
    config = function()
      require("toggleterm").setup({
        shade_terminals = false,
        shell = "/usr/bin/zsh",
        open_mapping = [[<c-\>]],
        direction = "float",
      })
    end,
  },

  -- Color checker
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
    keys = {
      {
        "<leader>ac",
        "<cmd>Colortils<cr>",
        desc = "Check colors",
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    pattern = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end,
    keys = {
      {
        "<leader>aC",
        "<cmd>ColorizerToggle<cr>",
        desc = "Toggle colorizer",
      },
    },
  },

  -- mark jumps
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = {
      {
        "<leader>ma",
        function()
          local harpoon = require("harpoon")
          harpoon:list():add()
        end,
        desc = "Toggle Harpoon",
      },

      {
        "<leader>mf",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Popups",
      },

      {
        "<leader>mn",
        function()
          local harpoon = require("harpoon")
          harpoon:list():next()
        end,
        desc = "Next Harpoon",
      },
      {
        "<leader>ml",
        function()
          local harpoon = require("harpoon")
          harpoon:list():prev()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Previous Harpoon",
      },
    },
  },
  -- easy align

  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function()
      require("mini.align").setup()
    end,
  },

  -- git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
    },
    event = "VeryLazy",
    config = function()
      require("neogit").setup()
    end,

    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Neogit", remap = true },
    },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
      { "<leader>gf", "<cmd>G<cr>", desc = "Git Fugitive", remap = true },
    },
  },
  { "tpope/vim-rhubarb", event = "VeryLazy" },
  { "shumphrey/fugitive-gitlab.vim", event = "VeryLazy" },
  { "tpope/vim-rhubarb", event = "VeryLazy" },
  {
    "rbong/vim-flog",
    event = "VeryLazy",
    keys = {
      { "<leader>gG", "<cmd>Flog<cr>", desc = "Git graph log" },
    },
  },

  --git gist
  {
    "mattn/vim-gist",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gSd",
        "<CMD>Gist -d<CR>",
        desc = "Delete gist",
      },
      {
        "<leader>gSl",
        "<CMD>Gist -l<CR>",
        desc = "Gist list",
      },
      {
        "<leader>gSm",
        "<CMD>Gist -a<CR>",
        desc = "Create gist with all buffers",
      },
      {
        "<leader>gSg",
        "<CMD>Gist<CR>",
        desc = "Create a gist",
      },
    },
  },
  { "mattn/webapi-vim", event = "VeryLazy" },

  -- git worktree
  {
    "ThePrimeagen/git-worktree.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gww",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "Navigate worktree",
      },
      {
        "<leader>gwc",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Create worktree",
      },
    },
  },

  -- git blame
  {
    "FabijanZulj/blame.nvim",
    event = "VeryLazy",
    config = true,
    keys = {
      {
        "<leader>gb",
        "<cmd>BlameToggle<cr>",
        desc = "Toggle Git Blame",
      },
    },
  },

  -- undotree
  -- {
  --   "mbbill/undotree",
  --   event = "VeryLazy",
  --   config = function()
  --     vim.g.undotree_WindowLayout = 2
  --   end,
  --
  --   keys = {
  --     {
  --       "<leader>au",
  --       "<cmd>UndotreeToggle<cr>",
  --       desc = "Undo Tree",
  --     },
  --   },
  -- },

  -- clipboard
  {
    "AckslD/nvim-neoclip.lua",
    event = "VeryLazy",
    config = function()
      require("neoclip").setup({
        default_register = "+",
      })
    end,

    keys = {
      {
        "<leader>sp",
        "<cmd>Telescope neoclip<cr>",
        desc = "Search clipboard (neoclip)",
      },
    },
  },
  -- Symbols outline

  {
    "vhyrro/luarocks.nvim",
    event = "VeryLazy",
    commit = "d73f4bbbeea9eeb9b66a0c6431db402654f43cb8",
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
    },
  },
  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    commit = "60428cc313b8cb11fa8fb1b94f289b14d3121fa4",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
    keys = {
      {
        "<leader>arr",
        "<cmd> Rest run cursor<cr>",
        desc = "Run request under cursor",
      },
      {
        "<leader>arl",
        "<cmd> Rest run last<cr>",
        desc = "Run last request",
      },
      {
        "<leader>arn",
        "<cmd> Rest result next<cr>",
        desc = "Run result next",
      },
      {
        "<leader>arp",
        "<cmd> Rest result prev<cr>",
        desc = "Run result prev",
      },
    },
  },

  -- {
  --   "mistweaverco/kulala.nvim",
  --   config = function()
  --     require("kulala").setup()
  --   end,
  --   keys = {
  --     {
  --       "<leader>arr",
  --       function()
  --         require("kulala").run()
  --       end,
  --       desc = "Run request under cursor",
  --     },
  --     {
  --       "<leader>arq",
  --       function()
  --         require("kulala").close()
  --       end,
  --
  --       desc = "Run last request",
  --     },
  --     {
  --       "<leader>arn",
  --       function()
  --         require("kulala").jump_next()
  --       end,
  --       desc = "Run result next",
  --     },
  --     {
  --       "<leader>arp",
  --       function()
  --         require("kulala").jump_prev()
  --       end,
  --       desc = "Run result prev",
  --     },
  --
  --     {
  --       "<leader>art",
  --       function()
  --         require("kulala").toggle_view()
  --       end,
  --       desc = "Toggle view",
  --     },
  --
  --     {
  --       "<leader>arc",
  --       function()
  --         require("kulala").copy()
  --       end,
  --       desc = "Copy current request",
  --     },
  --   },
  -- },

  -- Telescope integration
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("undo")
        -- require("telescope").load_extension("harpoon")
        -- require("telescope").load_extension("rest")
      end)
    end,
    keys = {
      {
        "<leader>fm",
        "<cmd>Telescope harpoon marks<cr>",
        desc = "Harpoon Find",
      },
      -- {
      --   "<leader>arv",
      --   "<cmd>Telescope rest select_env<cr>",
      --   desc = "Rest select environment",
      -- },
    },
  },
}
