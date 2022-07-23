require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = false,
        neorg_leader = "<localleader>",
        hook = function(keybinds)
          local leader = "<localleader>"

          -- Map all the below keybinds only when the "norg" mode is active
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

              -- Keys for managing GTD
              { leader .. "tc", "core.gtd.base.capture" },
              { leader .. "tv", "core.gtd.base.views" },
              { leader .. "te", "core.gtd.base.edit" },

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
              { "<C-t>", "core.integrations.telescope.insert_link" },
              { "<C-f>", "core.integrations.telescope.insert_file_link" },
            },
          }, {
            silent = true,
            noremap = true,
          })

          -- Map the below keys only when traverse-heading mode is active
          keybinds.map_event_to_mode("traverse-heading", {
            n = {
              -- Rebind j and k to move between headings in traverse-heading mode
              { "j", "core.integrations.treesitter.next.heading" },
              { "k", "core.integrations.treesitter.previous.heading" },
            },
          }, {
            silent = true,
            noremap = true,
          })

          keybinds.map_event_to_mode("toc-split", {
            n = {
              { "<CR>", "core.norg.qol.toc.hop-toc-link" },

              -- Keys for closing the current display
              { "q", "core.norg.qol.toc.close" },
              { "<Esc>", "core.norg.qol.toc.close" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })

          -- Map the below keys on gtd displays
          keybinds.map_event_to_mode("gtd-displays", {
            n = {
              { "<CR>", "core.gtd.ui.goto_task" },

              -- Keys for closing the current display
              { "q", "core.gtd.ui.close" },
              { "<Esc>", "core.gtd.ui.close" },

              { "e", "core.gtd.ui.edit_task" },
              { "<Tab>", "core.gtd.ui.details" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })

          -- Map the below keys on presenter mode
          keybinds.map_event_to_mode("presenter", {
            n = {
              { "<CR>", "core.presenter.next_page" },
              { "l", "core.presenter.next_page" },
              { "h", "core.presenter.previous_page" },

              -- Keys for closing the current display
              { "q", "core.presenter.close" },
              { "<Esc>", "core.presenter.close" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })
          -- Apply the below keys to all modes
          keybinds.map_to_mode("all", {
            n = {
              { leader .. "mn", "<CMD>Neorg mode norg<CR>" },
              { leader .. "mh", "<CMD>Neorg mode traverse-heading<CR>" },

              -- etc
              { leader .. "ak", "<CMD>Neorg kanban toggle<CR>" },
              { leader .. "ai", "<CMD>Neorg inject-metadata<CR>" },
              { leader .. "aj", "<CMD>Neorg journal" },
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
    ["core.export"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "home",
        exclude = {
          "documents",
        },
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/Documents/records/work",
          home = "~/Documents/records/home",
          default = vim.fn.getcwd(),
        },
        autochdir = true,
        index = "index.norg",
        default_workspace = "home",
      },
    },
    ["core.norg.concealer"] = {
      config = {
        icon_preset = "varied",
        markup_preset = "safe",
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.norg.journal"] = {
      config = {
        workspace = "home",
      },
    },
    ["core.norg.manoeuvre"] = {},
    ["core.norg.qol.toc"] = {},
    -- ["core.presenter"] = {
    --   config = {
    --     zen_mode = "truezen",
    --   },
    -- },
    -- external module

    ["core.integrations.telescope"] = {},
    ["external.gtd-project-tags"] = {},
    ["external.kanban"] = {},
  },
}

vim.cmd [[
		  augroup norg
			au!
			autocmd FileType norg let maplocalleader=" o"
		  augroup end
]]
