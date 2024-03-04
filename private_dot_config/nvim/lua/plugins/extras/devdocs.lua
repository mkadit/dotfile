return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
  cmd = {
    "DevdocsOpen",
    "DevdocsOpenCurrent",
    "DevdocsFetch",
    "DevdocsInstall",
    "DevdocsUninstall",
    "DevdocsUpdate",
  },
  keys = {

    { "<leader>sv", "<cmd>DevdocsOpenCurrent<cr>", desc = "Search Devdocs (current filetype)" },
    { "<leader>sV", "<cmd>DevdocsOpen<cr>", desc = "Search Devdocs" },
  },
}
