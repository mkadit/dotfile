return {
  "kristijanhusak/vim-dadbod-ui",
  event = "VeryLazy",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  keys = {
    { "<leader>aD", "<cmd>DBUIToggle<cr>", desc = "Database Toggle" },
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
