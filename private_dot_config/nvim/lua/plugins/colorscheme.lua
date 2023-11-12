return {

  -- Nordic
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("nordic").load()
    end,
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    name = "nightfox",
  },
}
