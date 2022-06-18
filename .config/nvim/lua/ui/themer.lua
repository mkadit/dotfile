require("themer").setup {
  colorscheme = "nord", -- default colorscheme
  transparent = false,
  term_colors = true,
  dim_inactive = false,
  disable_telescope_themes = {},
  styles = {
    heading = {
      h1 = {},
      h2 = {},
    },
    ["function"] = { style = "italic" },
    functionbuiltin = { style = "italic" },
    variable = { style = "italic" },
    variableBuiltIn = { style = "italic" },
    include = {},
    identifier = {},
    keyword = {},
    keywordBuiltIn = {},
    struct = {},
    string = {},
    parameter = { style = "italic" },
    field = {},
    type = {},
    typeBuiltIn = {},
    property = {},
    comment = {},
    punctuation = {},
    constructor = {},
    operator = {},
    constant = {},
    constantBuiltIn = {},
    todo = {},
    character = {},
    conditional = {},
    number = {},
    statement = {},
    uri = {},
    diagnostic = {
      underline = {
        error = {},
        warn = {},
        info = {},
        hint = {},
      },
      virtual_text = {
        error = {},
        warn = {},
        info = {},
        hint = {},
      },
    },
  },
  remaps = {
    -- palette = {},
    -- per colorscheme palette remaps, for example:
    -- remaps.palette = {
    --     rose_pine = {
    --     	fg = "#000000"
    --     }
    -- },
    -- remaps.highlights = {
    --     rose_pine = {
    --	base = {
    --     	  Normal = { bg = "#000000" }
    --	},
    --     }
    -- },
    --
    -- Also you can do remaps.highlights.globals  for global highlight remaps
    highlights = {
      globals = {
        base = {
          DiffText = {
            link = "GitSignsAdd",
          },
          DiffAdd = {
            link = "GitSignsAdd",
          },
          DiffChange = {
            link = "GitSignsDelete",
          },
          DiffDelete = {
            link = "GitSignsChange",
          },
          diffAdded = {
            link = "GitSignsAdd",
          },
          diffRemoved = {
            link = "GitSignsDelete",
          },
          diffChanged = {
            link = "GitSignsChange",
          },
        },
      },
      nord = {
        base = {
          Normal = {
            bg = "#2e3440",
            fg = "#e5e9f0",
          },
          TabLine = {
            bg = "#3b4252",
            fg = "#4c566a",
          },
          TabLineSel = {
            bg = "#3b4252",
            fg = "#a3be8c",
          },
          TabLineFill = {
            bg = "#3b4252",
            fg = "#4c566a",
          },
        },
      },
    },
  },

  langs = {
    html = true,
    md = true,
  },

  plugins = {
    treesitter = true,
    indentline = true,
    barbar = false,
    bufferline = false,
    cmp = false,
    gitsigns = false,
    lsp = true,
    telescope = true,
  },
  enable_installer = false, -- enable installer module
}
