local telescope = require "telescope"
local actions = require "telescope.actions"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"

local options = {
    defaults = {
        mappings = {
            i = {
                ["<C-w>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-t>"] = actions.select_tab,
                ["<C-k>"] = actions.which_key,
                ["<C-e>"] = actions.delete_buffer,
            },
            n = {
                ["<C-w>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-t>"] = actions.select_tab,
                ["<C-k>"] = actions.which_key,
                ["<C-e>"] = actions.delete_buffer,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "❱❱ ",
        selection_caret = "❱ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = { mirror = false },
            vertical = { mirror = false },
        },
        file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = {},
        -- generic_sorter = sorters.get_generic_fuzzy_sorter,
        -- fzy-sorter equivalent
        generic_sorter = require("mini.fuzzy").get_telescope_sorter,
        winblend = 0,
        border = {},
        borderchars = {
            prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
            results = { "─", " ", " ", " ", "─", "─", " ", " " },
            preview = { "─", " ", " ", "│", "┬", " ", " ", "│" },
        },
        color_devicons = true,
        use_less = false,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
    },
}
telescope.setup(options)
