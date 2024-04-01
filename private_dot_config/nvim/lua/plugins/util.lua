local Util = require("util")
return {

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  -- session management
  {
    "echasnovski/mini.sessions",
    version = false,
    event = "VimEnter",
    config = function()
      require("mini.sessions").setup({
        -- No need to copy this inside `setup()`. Will be used automatically.
        {
          -- Whether to read latest session if Neovim opened without file arguments
          autoread = false,

          -- Whether to write current session before quitting Neovim
          autowrite = true,

          -- Directory where global sessions are stored (use `''` to disable)
          directory = "~/.local/share/nvim/session", --<"session" subdir of user data directory from |stdpath()|>,

          -- File for local session (use `''` to disable)
          file = "",

          -- Whether to force possibly harmful actions (meaning depends on function)
          force = { read = false, write = true, delete = false },

          -- Hook functions for actions. Default `nil` means 'do nothing'.
          hooks = {
            -- Before successful action
            pre = { read = nil, write = nil, delete = nil },
            -- After successful action
            post = { read = nil, write = nil, delete = nil },
          },

          -- Whether to print session path after action
          verbose = { read = false, write = true, delete = true },
        },
      })
    end,
    -- stylua: ignore
    keys = {
      { "<leader>qr", function() MiniSessions.select("read") end, desc = "Restore Session" },
      { "<leader>qw", function() vim.ui.input(
          { prompt = "Seesion name: " },
          function(name)
            MiniSessions.write(name)
          end)
      end,
        desc = "Write Session" },
      { "<leader>qd", function() MiniSessions.select("delete") end, desc = "Delete Session" },
    },
  },
  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- handy pairs mapping
  -- {
  --   "echasnovski/mini.basics",
  --   event = "VeryLazy",
  --   config = function()
  --     require("mini.basics").setup()
  --   end,
  -- },
  -- {
  --   "echasnovski/mini.bracketed",
  --   event = "VeryLazy",
  --   config = function()
  --     require("mini.bracketed").setup()
  --   end,
  -- },
  -- {
  --   "echasnovski/mini.animate",
  --   event = "VeryLazy",
  --   config = function()
  --     require("mini.animate").setup()
  --   end,
  -- },

  -- file manager
  {
    "vifm/vifm.vim",
    event = "VeryLazy",
    keys = {
      {
        "<Leader>av",
        "<CMD>Vifm<CR>",
        desc = "File manager",
      },
    },
  },

  -- sudo
  { "lambdalisue/suda.vim", event = "VeryLazy" },

  -- root
  {
    "airblade/vim-rooter",
    event = "VeryLazy",
    keys = {
      {
        "<Leader>aj",
        "<CMD>Rooter | cd .<CR>",
        desc = "To currend directory root",
      },
    },
  },

  -- Translate
  {
    "potamides/pantran.nvim",
    event = "VeryLazy",
    config = function()
      require("pantran").setup({
        default_engine = "google",
      })
    end,
  },

  {
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    opts = {
      -- seconds until grace
      grace_period = 60 * 10,
      wakeup_delay = 3,
    },
  },

  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },

    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,

    event = "VeryLazy",
  },
  {
    "telescope.nvim",
    optional = true,
    opts = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("projects")
      end)
    end,
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    },
  },
}
