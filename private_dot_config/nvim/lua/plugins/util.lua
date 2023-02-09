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

  -- Hnady pairs mapping
  { "tpope/vim-unimpaired", event = "VeryLazy" },

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
}
