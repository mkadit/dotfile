local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-w>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-t>"] = actions.select_tab,
                ["<C-k>"] = actions.which_key,
                ["<C-e>"] = actions.delete_buffer
            },
            n = {
                ["<C-w>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-t>"] = actions.select_tab,
                ["<C-k>"] = actions.which_key,
                ["<C-e>"] = actions.delete_buffer
            }
        },
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case'
        },
        prompt_prefix = "❱❱ ",
        selection_caret = "❱ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {mirror = false},
            vertical = {mirror = false}
        },
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    }
}
require('telescope').load_extension('fzy_native', 'project', 'media_files')

local M = {}
M.git_branches = function()
    require("telescope.builtin").git_branches(
        {
            attach_mappings = function(_, map)
                map('i', '<c-d>', actions.git_delete_branch)
                map('n', '<c-d>', actions.git_delete_branch)
                return true
            end
        })
end

return M

