require("neotest").setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
      runner = "pytest",
    },
    -- require("neotest-plenary"),
    require "neotest-go",
    -- require("neotest-jest")({
    --   jestCommand = "npm test --"
    -- })
    -- require "neotest-vim-test" {
    --   ignore_file_types = { "python", "vim", "lua" },
    -- },
  },
}

-- vim.cmd [[
-- let g:test#javascript#runner = 'jest'
-- ]]
