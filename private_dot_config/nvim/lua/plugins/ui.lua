local Util = require("util")

return {
  -- Better `vim.notify()`
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end

      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      local icons = require("config").icons

      local function fg(name)
        return function()
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "dashboard", "lazy", "alpha" },
            winbar = {
              { "dashboard", "lazy", "alpha" },
            },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              "filename",
              path = 1,
              symbols = { modified = "  ", readonly = "", unnamed = "" },
              color = fg("Special"),
            },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
            },

            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant") ,
            },
            { "overseer" },

            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },

            {
              "diff",
              colored = true,
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "progress", separator = "", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        tabline = {
          lualine_a = { "tabs" },
          lualine_b = { "filename" },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },

        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "neo-tree" },
      }
    end,
  },

  -- indent guides for Neovim
  -- Rainbow bracket
  {
    "hiphish/rainbow-delimiters.nvim",
    pattern = "VeryLazy",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          -- commonlisp = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        -- Color follows indent-blankline.nvim
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
        -- blacklist = { "c", "cpp" },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {

      indent = {
        char = "│",
        tab_char = "│",
        -- highlight = highlight,
      },
      scope = {
        enabled = true,
      },
      exclude = {
        filetypes = {
          "Trouble",
          "alpha",
          "dashboard",
          "help",
          "lazy",
          "lazyterm",
          "mason",
          "neo-tree",
          "notify",
          "toggleterm",
        },
      },
    },
    -- main = "ibl",
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      opts.indent.highlight = highlight
      opts.scope.highlight = highlight

      require("ibl").setup(opts)

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "LazyFile",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "Trouble",
          "alpha",
          "dashboard",
          "help",
          "lazy",
          "lazyterm",
          "mason",
          "neo-tree",
          "notify",
          "toggleterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#ffffff" })
      require("mini.indentscope").setup(opts)
    end,
  },

  -- noicer ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    },
  },

  -- dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      local logo = [[
    ███╗   ███╗██╗  ██╗ █████╗ ██████╗ ██╗████████╗
    ████╗ ████║██║ ██╔╝██╔══██╗██╔══██╗██║╚══██╔══╝
    ██╔████╔██║█████╔╝ ███████║██║  ██║██║   ██║
    ██║╚██╔╝██║██╔═██╗ ██╔══██║██║  ██║██║   ██║
    ██║ ╚═╝ ██║██║  ██╗██║  ██║██████╔╝██║   ██║
    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝   ╚═╝
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("b", "󰏚 " .. " Notes", ":e ~/Documents/records/vault/personal/index.md<CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("C", " " .. " Dotfiles", ":Telescope config_pick <CR>"),
        dashboard.button("s", "勒" .. " Restore Session", [[:lua MiniSessions.select("read")<cr>]]),
        dashboard.button("p", " " .. "Search Project", ":Telescope projects<CR>"),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      vim.b.miniindentscope_disable = true

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  -- lsp symbol navigation for lualine
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("util").lsp.on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("config").icons.kinds,
      }
    end,
  },

  -- icons
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },

  -- Buffer resizigin
  {
    "kwkarlwang/bufresize.nvim",
    event = "VeryLazy",
    config = function()
      require("bufresize").setup()
    end,
  },

  -- sticky buffer
  {
    "stevearc/stickybuf.nvim",
    event = "VeryLazy",
    opts = {},
  },

  { "yorickpeterse/nvim-pqf", event = "VeryLazy", opts = {} },
  -- init.lua
  {
    "lukas-reineke/headlines.nvim",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },
}
