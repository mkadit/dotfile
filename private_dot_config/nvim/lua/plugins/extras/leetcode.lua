local leet_arg = "leet.nvim"
return {

  "kawre/leetcode.nvim",
  lazy = leet_arg ~= vim.fn.argv()[1],
  build = ":TSUpdate html",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- recommended
    "rcarriga/nvim-notify",
  },
  opts = {
    -- configuration goes here
    arg = leet_arg,
    lang = "golang",
  },
}
