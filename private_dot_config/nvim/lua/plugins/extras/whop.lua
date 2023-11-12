local Util = require("util")
return {

  {
    "biozz/whop.nvim",
    event = "LazyFile",
    config = function()
      require("whop").setup({
        commands = {
          { name = "Decode JWT", cmd = [[%! jc --jwt]] },
          { name = "YAML to JSON", cmd = [[%! jc --yaml]] },
          { name = "XML to JSON", cmd = [[%! jc --xml]] },
        },
      })
    end,
  },
  -- Telescope integration
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("whop")
      end)
    end,
    keys = {
      {
        "<leader>cw",
        "<cmd>Telescope whop<cr>",
        desc = "Whop",
      },
    },
  },
}
