local tab_line = {
  bg = "#3b4252",
  fg = "#4c566a",
  -- name = "TabLine",
  style = "",
}

-- Normal
local normal_line = {
  bg = "#2e3440",
  fg = "#e5e9f0",
  -- name = "Normal",
  style = "",
}

-- TabLineSel
local tab_line_sel = {
  bg = "#3b4252",
  fg = "#a3be8c",
  -- name = "TabLineSel",
  style = "",
}

-- TabLineFill
local tab_line_fill = {
  bg = "#3b4252",
  fg = "#4c566a",
  -- name = "TabLineFill",
  style = "",
}

local filename = require "tabby.filename"
local util = require "tabby.util"

local hl_tabline = tab_line
local hl_normal = normal_line
local hl_tabline_sel = tab_line_sel
local hl_tabline_fill = tab_line_fill

local function tab_label(tabid, active)
  local icon = active and "" or ""
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid)
  return string.format(" %s %d: %s ", icon, number, name)
end

local function tab_label_no_fallback(tabid, active)
  local icon = active and "" or ""
  local fallback = function()
    return ""
  end
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid, fallback)
  if name == "" then
    return string.format(" %s %d ", icon, number)
  end
  return string.format(" %s %d: %s ", icon, number, name)
end

local function win_label(winid, top)
  local icon = top and "" or ""
  return string.format(" %s %s ", icon, filename.unique(winid))
end

local tabline = {
  active_wins_at_tail = {
    hl = "TabLineFill",
    layout = "active_wins_at_tail",
    head = {
      { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
      { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          tab_label(tabid, true),
          hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          tab_label(tabid),
          hl = { fg = hl_tabline.fg, bg = hl_tabline.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    top_win = {
      label = function(winid)
        return {
          win_label(winid, true),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    win = {
      label = function(winid)
        return {
          win_label(winid),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    tail = {
      { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
    },
  },
  active_wins_at_end = {
    hl = "TabLineFill",
    layout = "active_wins_at_end",
    head = {
      { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
      { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          tab_label(tabid, true),
          hl = { fg = hl_normal.fg, bg = hl_normal.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          tab_label(tabid),
          hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    },
    top_win = {
      label = function(winid)
        return {
          win_label(winid, true),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    win = {
      label = function(winid)
        return {
          win_label(winid),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
  },
  active_tab_with_wins = {
    hl = "TabLineFill",
    layout = "active_tab_with_wins",
    head = {
      { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg, style = "italic" } },
      { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          tab_label(tabid, true),
          hl = { fg = hl_normal.fg, bg = hl_normal.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          tab_label(tabid),
          hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    },
    top_win = {
      label = function(winid)
        return {
          win_label(winid, true),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    win = {
      label = function(winid)
        return {
          win_label(winid),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
  },
  tab_with_top_win = {
    hl = "TabLineFill",
    layout = "tab_with_top_win",
    head = {
      { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg, style = "italic" } },
      { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          tab_label_no_fallback(tabid, true),
          hl = { fg = hl_normal.fg, bg = hl_normal.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          tab_label_no_fallback(tabid),
          hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    },
    active_win = {
      label = function(winid)
        return {
          win_label(winid, true),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    win = {
      label = function(winid)
        return {
          win_label(winid),
          hl = "TabLine",
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
  },
  tab_only = {
    hl = "TabLineFill",
    layout = "tab_only",
    head = {
      { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
      { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          tab_label(tabid, true),
          hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          tab_label(tabid, false),
          hl = { fg = hl_tabline.fg, bg = hl_tabline.bg, style = "bold" },
        }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
  },
}

require("tabby").setup {
  tabline = tabline.active_wins_at_end,
}
