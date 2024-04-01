return {

  -- Nordic
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").load()
  --   end,
  -- },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    event = "VeryLazy",
    name = "catppuccin",
  },

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    event = "VeryLazy",
    name = "nightfox",
  },
  {
    "neanias/everforest-nvim",
    name = "everforest",
    version = false,
    event = "VeryLazy",
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },
  { "sainnhe/gruvbox-material", event = "VeryLazy", name = "gruvbox-material" },
  { "rose-pine/neovim", event = "VeryLazy", name = "rose-pine" },
}
