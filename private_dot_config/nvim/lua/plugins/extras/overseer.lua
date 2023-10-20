return {
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({
        -- strategy = "toggleterm",

        templates = { "builtin", "user.compile_build" },
      })
    end,

    keys = {

      { "<leader>aor", "<cmd>OverseerRun<cr>" },
      { "<leader>aot", "<cmd>OverseerToggle<cr>" },
      { "<leader>aoa", "<cmd>OverseerTaskAction<cr>" },
    },
  },
}
