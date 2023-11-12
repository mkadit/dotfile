return {

  -- add typescript to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function(_, opts)
          require("dap-vscode-js").setup({
            debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
            adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
          })
        end,
      },
      -- lazy spec to build "microsoft/vscode-js-debug" from source
      {
        "microsoft/vscode-js-debug",
        version = "1.76.1",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["pwa-node"] then
        require("dap").adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = {
              require("mason-registry").get_package("js-debug-adapter"):get_install_path()
                .. "/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "svelte" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              -- name = "Attach",
              name = "Attach debugger to existing `node --inspect` process",
              sourceMaps = true,
              -- resolve source maps in nested locations while ignoring node_modules
              resolveSourceMapLocations = {
                "${workspaceFolder}/**",
                "!**/node_modules/**",
              },
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
              -- we don't want to debug code inside node_modules, so skip it!
              skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
            },
            {
              type = "pwa-chrome",
              name = "Launch Chrome to debug client",
              request = "launch",
              url = "http://localhost:3000",
              sourceMaps = true,
              protocol = "inspector",
              port = 9222,
              webRoot = "${workspaceFolder}/src",
              -- skip files from vite's hmr
              skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
            },
            -- only if language is javascript, offer this debug action
            language == "javascript"
                and {
                  -- use nvim-dap-vscode-js's pwa-node debug adapter
                  type = "pwa-node",
                  -- launch a new process to attach the debugger to
                  request = "launch",
                  -- name of the debug action you have to select for this config
                  name = "Launch file in new node process",
                  -- launch current file
                  program = "${file}",
                  cwd = "${workspaceFolder}",
                }
              or nil,
          }
        end
      end
    end,
  },

  -- {
  --   "pmizio/typescript-tools.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
}
