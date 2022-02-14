-- vim.g.bufferline = {
--     -- Enable/disable animations
--     animation = false,

--     -- Enable/disable auto-hiding the tab bar when there is a single buffer
--     auto_hide = false,

--     -- Enable/disable icons
--     -- if set to 'numbers', will show buffer index in the tabline
--     -- if set to 'both', will show buffer index and icons in the tabline
--     icons = true,
--     icon_close_tab = '',
--     icon_close_tab_modified = ' ',

--     -- Enable/disable close button
--     closable = true,

--     -- Enables/disable clickable tabs
--     --  - left-click: go to buffer
--     --  - middle-click: delete buffer
--     clickable = true,

--     -- If set, the letters for each buffer in buffer-pick mode will be
--     -- assigned based on their name. Otherwise or in case all letters are
--     -- already assigned, the behavior is to assign letters in order of
--     -- usability (see order below)
--     semantic_letters = true,

--     -- Sets the maximum padding width with which to surround each tab
--     maximum_padding = 2,

-- }
-- require("tabby").setup({
--     tabline = require("tabby.presets").tab_with_top_win,
-- })
local colors = {
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
    red = "#BF616A",
}

local get_hex = require("cokeline/utils").get_hex
local mappings = require "cokeline/mappings"

local comments_fg = get_hex("Comment", "fg")
local errors_fg = get_hex("DiagnosticError", "fg")
local warnings_fg = get_hex("DiagnosticWarn", "fg")

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_3

local components = {
    space = {
        text = " ",
        truncation = { priority = 1 },
    },

    two_spaces = {
        text = "  ",
        truncation = { priority = 1 },
    },

    separator = {
        text = function(buffer)
            return buffer.index ~= 1 and "▏" or ""
        end,
        truncation = { priority = 1 },
    },

    devicon = {
        text = function(buffer)
            return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
                or buffer.devicon.icon
        end,
        hl = {
            fg = function(buffer)
                return (mappings.is_picking_focus() and yellow)
                    or (mappings.is_picking_close() and red)
                    or buffer.devicon.color
            end,
            style = function(_)
                return (mappings.is_picking_focus() or mappings.is_picking_close()) and "italic,bold" or nil
            end,
        },
        truncation = { priority = 1 },
    },

    index = {
        text = function(buffer)
            return buffer.index .. ": "
        end,
        truncation = { priority = 1 },
    },

    unique_prefix = {
        text = function(buffer)
            return buffer.unique_prefix
        end,
        hl = {
            fg = comments_fg,
            style = "italic",
        },
        truncation = {
            priority = 3,
            direction = "left",
        },
    },

    filename = {
        text = function(buffer)
            return buffer.filename
        end,
        hl = {
            style = function(buffer)
                return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
                    or (buffer.is_focused and "bold")
                    or (buffer.diagnostics.errors ~= 0 and "underline")
                    or nil
            end,
        },
        truncation = {
            priority = 2,
            direction = "left",
        },
    },

    diagnostics = {
        text = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and "  " .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
                or ""
        end,
        hl = {
            fg = function(buffer)
                return (buffer.diagnostics.errors ~= 0 and errors_fg)
                    or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                    or nil
            end,
        },
        truncation = { priority = 1 },
    },

    close_or_unsaved = {
        text = function(buffer)
            return buffer.is_modified and "●" or ""
        end,
        hl = {
            fg = function(buffer)
                return buffer.is_modified and green or nil
            end,
        },
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
    },
}

require("cokeline").setup {
    show_if_buffers_are_at_least = 2,

    buffers = {
        -- filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
        -- filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
        new_buffers_position = "next",
    },

    rendering = {
        max_buffer_width = 30,
    },

    default_hl = {
        focused = {
            fg = get_hex("Normal", "fg"),
            bg = get_hex("ColorColumn", "bg"),
        },
        unfocused = {
            fg = get_hex("Comment", "fg"),
            bg = get_hex("ColorColumn", "bg"),
        },
    },

    components = {
        components.space,
        components.separator,
        components.space,
        components.devicon,
        components.space,
        components.index,
        components.unique_prefix,
        components.filename,
        components.diagnostics,
        components.two_spaces,
        components.close_or_unsaved,
        components.space,
    },
}
