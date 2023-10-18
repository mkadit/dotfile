-- FIX: Rework all
return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    keys = {

      { "<leader>ai", "<cmd>Neorg workspace home<cr>", desc = "Go to workspace home" },
      { "<leader>aI", "<cmd>Neorg return<cr>", desc = "Return from Neorg" },
    },
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              home = "~/Documents/records/home",
              work = "~/Documents/records/work",
              default = vim.fn.getcwd(),
            },
            autochdir = true,
            index = "index.norg",
            default_workspace = "home",
          },
        },
        ["core.keybinds"] = {
          config = {
            neorg_leader = " o",
            hook = function(keybinds)
              local leader = " o"
              keybinds.map_event_to_mode("norg", {
                n = { -- Bind keys in normal mode

                  -- Keys for managing TODO items and setting their states
                  { "ghu", "core.norg.qol.todo_items.todo.task_undone" },
                  { "ghp", "core.norg.qol.todo_items.todo.task_pending" },
                  { "ghd", "core.norg.qol.todo_items.todo.task_done" },
                  { "ghh", "core.norg.qol.todo_items.todo.task_on_hold" },
                  { "ghc", "core.norg.qol.todo_items.todo.task_cancelled" },
                  { "ghr", "core.norg.qol.todo_items.todo.task_recurring" },
                  { "ghi", "core.norg.qol.todo_items.todo.task_important" },
                  { "gh ", "core.norg.qol.todo_items.todo.task_cycle" },

                  -- Keys for managing notes
                  { leader .. "nn", "core.norg.dirman.new.note" },

                  { "<CR>", "core.norg.esupports.hop.hop-link" },
                  -- { "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit" },

                  -- Keys for telescope
                  { leader .. "fl", "core.integrations.telescope.find_linkable" },
                  { leader .. "fp", "core.integrations.telescope.find_project_tasks" },
                  { leader .. "fc", "core.integrations.telescope.find_context_tasks" },
                },
                i = {
                  -- { "<C-l>", "core.integrations.telescope.insert_link" },
                  { "<C-f>", "core.integrations.telescope.insert_file_link" },
                },
              }, {
                silent = true,
                noremap = true,
              })
              -- Apply the below keys to all modes
              keybinds.map_to_mode("all", {
                n = {
                  { leader .. "mn", "<CMD>Neorg mode norg<CR>" },
                  { leader .. "mh", "<CMD>Neorg mode traverse-heading<CR>" },

                  -- etc
                  { leader .. "ak", "<CMD>Neorg kanban toggle<CR>" },
                  { leader .. "ai", "<CMD>Neorg inject-metadata<CR>" },
                  { leader .. "aj", "<CMD>Neorg journal<CR>" },
                  { leader .. "an", "<CMD>Neorg toc split<CR>" },
                  { leader .. "aq", "<CMD>Neorg toc toqflist<CR>" },
                  { leader .. "ar", "<CMD>Neorg return<CR>" }, -- Return to previous
                  { leader .. "aw", "<CMD>Neorg workspace<CR>" },
                  -- { leader .. "fP", ":Neorg gtd_project_tags 1 1 1<CR>" },
                },
              }, {
                silent = true,
                noremap = true,
              })
            end,
          },
        },
        ["core.concealer"] = {
          config = {
            icon_preset = "varied",
            markup_preset = "safe",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.journal"] = {
          config = {
            workspace = "home",
          },
        },
        ["core.integrations.telescope"] = {},
        ["core.summary"] = {},
        ["core.export"] = {},
        -- ["core.ui.calendar"] = {},
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
    event = "VeryLazy",
    -- ft = "norg",
  },
}
