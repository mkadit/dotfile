return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
  keys = {

    { "<leader>sd", "<cmd>DevdocsOpenFloat<cr>", desc = "Search Devdocs" },
    { "<leader>sD", "<cmd>DevdocsOpenCurrentFloat<cr>", desc = "Search Devdocs (current filetype)" },
  },
}
