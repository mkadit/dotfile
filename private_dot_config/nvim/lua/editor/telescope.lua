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
    extension = {
      git_worktree = {},
    },
  },
}
telescope.setup(options)

function Split(s, delimiter)
  local result = {}
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

local M = {}
function M.test_grep_filename()
  local opts = {
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        -- filename is available at entry[1]
        local entry = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        local filepath = entry[1]
        local filesplit = Split(filepath, "/") -- Split paths
        local filename = filesplit[#filesplit - 0] -- File name
        -- Insert filename in current cursor position
        vim.cmd("normal i" .. filename)
      end)
      return true
    end,
  }
  require("telescope.builtin").find_files(opts)
end

return M
