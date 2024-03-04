return {
  -- {
  --   "nomnivore/ollama.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --
  --   -- All the user commands added by the plugin
  --   cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  --
  --   -- Sample keybind for prompting. Note that the <c-u> is important for selections to work properly.
  --   keys = {
  --     {
  --       "<leader>aO",
  --       ":<c-u>lua require('ollama').prompt()<cr>",
  --       desc = "ollama prompt",
  --       mode = { "n", "v" },
  --     },
  --   },
  --
  --   opts = {
  --     model = "codellama",
  --     url = "http://127.0.0.1:11434",
  --     serve = {
  --       on_start = false,
  --       command = "ollama",
  --       args = { "serve" },
  --       stop_command = "pkill",
  --       stop_args = { "-SIGTERM", "ollama" },
  --     },
  --   },
  -- },

  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "codellama", -- The default model to use.
      display_mode = "float", -- The display mode. Can be "float" or "split".
      show_prompt = false, -- Shows the Prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      debug = false, -- Prints errors and the command which is run.
    },

    keys = {
      {
        "<leader>aOr",
        ":Gen<CR>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>aOm",
        function()
          require("gen").select_model()
        end,
        desc = "ollama model",
        mode = { "n", "v" },
      },
    },
  },
}
