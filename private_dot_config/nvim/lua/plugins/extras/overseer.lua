return {
  {
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    config = function()
      require("overseer").setup({
        -- strategy = "toggleterm",

        templates = { "builtin", "user.compile_build", "user.dlv_run" },
      })
    end,

    keys = {

      { "<leader>aor", "<cmd>OverseerRun<cr>" },
      { "<leader>aot", "<cmd>OverseerToggle<cr>" },
      { "<leader>aol", "<cmd>OverseerQuickAction<cr>" },
      { "<leader>aoa", "<cmd>OverseerTaskAction<cr>" },
    },
  },
}
