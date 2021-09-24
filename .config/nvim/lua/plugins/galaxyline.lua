local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section

local color = {
  bg = "NONE",
  -- bg = "#2E3440",
  fg = "#81A1C1",
  line_bg = "NONE",
  lbg = "NONE",
  -- lbg = "#3B4252",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#B39DF3",
  gray = "#616E88",
  blue = "#5E81AC",
  red = "#BF616A"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {color.blue, color.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = color.blue,
        i = color.yellow,
        v = color.magenta,
        [""] = color.magenta,
        V = color.magenta,
        c = color.red,
        no = color.magenta,
        s = color.orange,
        S = color.orange,
        [""] = color.orange,
        ic = color.yellow,
        R = color.purple,
        Rv = color.purple,
        cv = color.red,
        ce = color.red,
        r = color.cyan,
        rm = color.cyan,
        ["r?"] = color.cyan,
        ["!"] = color.red,
        t = color.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "     "
    end,
    highlight = {color.red, color.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, color.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {color.purple, color.bg},
    highlight = {color.purple, color.line_bg, "bold"}
  }
}


section.right[1] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {color.red, color.line_bg},
    separator_highlight = {color.bg, color.bg}
  }
}
section.right[2] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = " ",
    highlight = {color.yellow, color.line_bg},
    separator_highlight = {color.bg, color.bg}
  }
}

section.right[3] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {color.green, color.line_bg},
    separator_highlight = {color.bg, color.bg}
  }
}

section.right[4] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = " ",
    highlight = {color.blue, color.line_bg},
    separator_highlight = {color.bg, color.bg}
  }
}


section.right[5] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {color.orange, color.line_bg}
  }
}
section.right[6] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = " ",
    separator_highlight = {color.purple, color.bg},
    highlight = {color.orange, color.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {color.green, color.line_bg}
  }
}
section.right[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {color.yellow, color.line_bg}
  }
}
section.right[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {color.red, color.line_bg}
  }
}

section.right[10] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " ",
    separator_highlight = {color.blue, color.line_bg},
    highlight = {color.gray, color.line_bg}
  }
}
-- section.right[11] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {nord_colors.blue, nord_colors.line_bg},
--     highlight = {nord_colors.fg, nord_colors.line_bg}
--   }
-- }

section.short_line_left[1] = {
  BufferType = {
    provider = "FileIcon",
    separator = " ",
    separator_highlight = {"NONE", color.lbg},
    highlight = {color.blue, color.lbg, "bold"}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function()
      local fileinfo = require("galaxyline.provider_fileinfo")
      local fname = fileinfo.get_current_file_name()
      for _, v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ""
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {color.white, color.lbg, "bold"}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {color.fg, color.lbg}
  }
}
