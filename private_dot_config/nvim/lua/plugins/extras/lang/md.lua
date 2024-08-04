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
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    event = "VeryLazy",
    ft = "markdown",
    opts = {},
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
}
