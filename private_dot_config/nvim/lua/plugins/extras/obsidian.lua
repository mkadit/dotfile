return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  --stylua: ignore start
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre ".. vim.fn.expand("~").."/Documents/records/vault/**.md",
    "BufNewFile ".. vim.fn.expand("~").."/Documents/records/vault/**.md",
    -- logseq pages
    -- "BufReadPre ".. vim.fn.expand("~").."/Documents/records/notes/pages/**.md",
    -- "BufNewFile ".. vim.fn.expand("~").."/Documents/records/notes/pages/**.md",
  },
  --stylua: ignore end
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/records/vault/personal",
      },

      -- {
      --   name = "logseq",
      --   path = "~/Documents/records/notes/pages/",
      -- },
    },

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        -- suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        suffix = title
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      -- return tostring(os.time()) .. "-" .. suffix
      return suffix
    end,
    --
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      wiki_link_func = function(opts)
        return string.format("[[%s]]", opts.path)
      end,
    },
    new_notes_location = "current_dir",

    -- Specify how to handle attachments.
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "assets", -- This is the default
      -- A function that determines the text to insert in the note when pasting an image.
      -- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
      -- This is the default implementation.
      ---@param client obsidian.Client
      ---@param path Path the absolute path to the image file
      ---@return string
      img_text_func = function(client, path)
        local link_path
        local vault_relative_path = client:vault_relative_path(path)
        if vault_relative_path ~= nil then
          -- Use relative path if the image is saved in the vault dir.
          link_path = vault_relative_path
        else
          -- Otherwise use the absolute path.
          link_path = tostring(path)
        end
        local display_name = vim.fs.basename(link_path)
        return string.format("![%s](%s)", display_name, link_path)
      end,
    },

    -- see below for full list of options 👇
    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>och"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
  },

  keys = {
    {
      "<CR>",
      "<CMD>ObsidianFollowLink<CR>",
      desc = "Follow Link",
    },
    {
      "<Backspace>",
      "<CMD>ObsidianBacklinks<CR>",
      desc = "Backlinks",
    },

    {
      "<leader>obt",
      "<CMD>ObsidianTemplate<CR>",
      desc = "Templates",
    },
    {
      "<leader>obp",
      "<CMD>ObsidianPasteImg<CR>",
      desc = "Paste Image",
    },

    {
      "<leader>obs",
      "<CMD>ObsidianSearch<CR>",
      desc = "Search in Obsidian",
    },
    {
      "<leader>obf",
      "<CMD>ObsidianQuickSwitch<CR>",
      desc = "Switch Files",
    },
  },
}
