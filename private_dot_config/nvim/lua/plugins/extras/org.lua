return {
  "nvim-orgmode/orgmode",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", lazy = true },
    {
      "lukas-reineke/headlines.nvim",
      config = true, -- or `opts = {}`
    },
    {
      "akinsho/org-bullets.nvim",
      config = true, -- or `opts = {}`
    },
  },
  event = "VeryLazy",
  config = function()
    -- Load treesitter grammar for org
    require("orgmode").setup_ts_grammar()

    -- Setup treesitter
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
      },
      ensure_installed = { "org" },
    })

    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/Documents/records/org/**/*",
      org_default_notes_file = "~/Documents/records/org/refile.org",
    })
  end,
}
