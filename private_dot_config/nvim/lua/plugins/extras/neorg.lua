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
              -- work = "~/Documents/records/work",
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
                  -- Marks the task under the cursor as "undone"
                  -- ^mark Task as Undone
                  { leader .. "tu", "core.qol.todo_items.todo.task_undone", opts = { desc = "Mark as Undone" } },

                  -- Marks the task under the cursor as "pending"
                  -- ^mark Task as Pending
                  { leader .. "tp", "core.qol.todo_items.todo.task_pending", opts = { desc = "Mark as Pending" } },

                  -- Marks the task under the cursor as "done"
                  -- ^mark Task as Done
                  { leader .. "td", "core.qol.todo_items.todo.task_done", opts = { desc = "Mark as Done" } },

                  -- Marks the task under the cursor as "on_hold"
                  -- ^mark Task as on Hold
                  { leader .. "th", "core.qol.todo_items.todo.task_on_hold", opts = { desc = "Mark as On Hold" } },

                  -- Marks the task under the cursor as "cancelled"
                  -- ^mark Task as Cancelled
                  {
                    leader .. "tc",
                    "core.qol.todo_items.todo.task_cancelled",
                    opts = { desc = "Mark as Cancelled" },
                  },

                  -- Marks the task under the cursor as "recurring"
                  -- ^mark Task as Recurring
                  {
                    leader .. "tr",
                    "core.qol.todo_items.todo.task_recurring",
                    opts = { desc = "Mark as Recurring" },
                  },

                  -- Marks the task under the cursor as "important"
                  -- ^mark Task as Important
                  {
                    leader .. "ti",
                    "core.qol.todo_items.todo.task_important",
                    opts = { desc = "Mark as Important" },
                  },

                  -- Marks the task under the cursor as "ambiguous"
                  -- ^mark Task as ambiguous
                  { leader .. "ta", "core.qol.todo_items.todo.task_ambiguous", opts = { desc = "Mark as Ambigous" } },

                  -- Switches the task under the cursor between a select few states
                  { "<C-Space>", "core.qol.todo_items.todo.task_cycle", opts = { desc = "Cycle Task" } },

                  -- Creates a new .norg file to take notes in
                  -- ^New Note
                  { leader .. "nn", "core.dirman.new.note", opts = { desc = "Create New Note" } },

                  -- Hop to the destination of the link under the cursor
                  { "<CR>", "core.esupports.hop.hop-link", opts = { desc = "Jump to Link" } },
                  { "gd", "core.esupports.hop.hop-link", opts = { desc = "Jump to Link" } },
                  { "gf", "core.esupports.hop.hop-link", opts = { desc = "Jump to Link" } },
                  { "gF", "core.esupports.hop.hop-link", opts = { desc = "Jump to Link" } },

                  -- Same as `<CR>`, except opens the destination in a vertical split
                  {
                    "<M-CR>",
                    "core.esupports.hop.hop-link",
                    "vsplit",
                    opts = { desc = "Jump to Link (Vertical Split)" },
                  },

                  { ">.", "core.promo.promote", opts = { desc = "Promote Object (Non-Recursively)" } },
                  { "<,", "core.promo.demote", opts = { desc = "Demote Object (Non-Recursively)" } },

                  { ">>", "core.promo.promote", "nested", opts = { desc = "Promote Object (Recursively)" } },
                  { "<<", "core.promo.demote", "nested", opts = { desc = "Demote Object (Recursively)" } },

                  { leader .. "lt", "core.pivot.toggle-list-type", opts = { desc = "Toggle (Un)ordered List" } },
                  { leader .. "li", "core.pivot.invert-list-type", opts = { desc = "Invert (Un)ordered List" } },

                  { leader .. "id", "core.tempus.insert-date", opts = { desc = "Insert Date" } },
                  -- Keys for telescope
                  {
                    leader .. "fl",
                    "core.integrations.telescope.find_linkable",
                    opts = {
                      desc = "Find Links",
                    },
                  },
                  -- { leader .. "fp", "core.integrations.telescope.find_project_tasks" },
                  -- { leader .. "fc", "core.integrations.telescope.find_context_tasks" },
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
                  { leader .. "mn", ":Neorg mode norg<CR>", opts = { desc = "Enter Norg Mode" } },
                  {
                    leader .. "mh",
                    ":Neorg mode traverse-heading<CR>",
                    opts = { desc = "Enter Heading Traversal Mode" },
                  },

                  -- etc
                  -- { leader .. "ak", "<CMD>Neorg kanban toggle<CR>" },
                  {
                    leader .. "ai",
                    "<CMD>Neorg inject-metadata<CR>",
                    opts = {
                      { desc = "Inject Metadata" },
                    },
                  },
                  {
                    leader .. "aj",
                    "<CMD>Neorg journal<CR>",
                    opts = {
                      { desc = "Open Journal" },
                    },
                  },
                  {
                    leader .. "an",
                    "<CMD>Neorg toc split<CR>",
                    opts = {
                      { desc = "Open ToC in Split" },
                    },
                  },
                  {
                    leader .. "ar",
                    "<CMD>Neorg return<CR>",
                    opts = {
                      { desc = "Return to File" },
                    },
                  }, -- Return to previous
                  {
                    leader .. "",
                    "<CMD>Neorg workspace<CR>",
                    opts = {
                      { desc = "Current Workspace" },
                    },
                  },
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
