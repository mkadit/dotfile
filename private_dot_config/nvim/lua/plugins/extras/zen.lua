return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    event = "VeryLazy",
    keys = {
      { "<leader>aF", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = true, -- disables the ruler text in the cmd line area
          showcmd = true, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        tmux = { enabled = true }, -- disables the tmux statusline
      },
    },
  },
  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    -- keys = {
    --   { "<leader>aW", "<cmd>Twilight<cr>", desc = "Twilight" },
    -- },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
