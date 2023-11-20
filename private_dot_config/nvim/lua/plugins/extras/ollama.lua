return {
  "nomnivore/ollama.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  -- Sample keybind for prompting. Note that the <c-u> is important for selections to work properly.
  keys = {
    {
      "<leader>aO",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },
  },

  opts = {
    -- your configuration overrides
  },
}
