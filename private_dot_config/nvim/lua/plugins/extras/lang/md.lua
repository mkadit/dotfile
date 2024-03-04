return {
  {
    "wallpants/github-preview.nvim",
    event = "VeryLazy",
    ft = "markdown",
    opts = {
      -- config goes here
    },
    config = function(_, opts)
      local gpreview = require("github-preview")
      gpreview.setup(opts)

      local fns = gpreview.fns
      vim.keymap.set("n", "<leader>opt", fns.toggle)
      vim.keymap.set("n", "<leader>ops", fns.single_file_toggle)
      vim.keymap.set("n", "<leader>opd", fns.details_tags_toggle)
    end,
  },
}
