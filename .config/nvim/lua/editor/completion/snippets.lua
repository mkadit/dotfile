local ls = require "luasnip"

--luasnip configuration
ls.config.set_config {
    -- Remember to keep around the last snippet to jump back if outside selection
    history = true,

    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true,
}

local snippets_folder = vim.fn.stdpath "config" .. "/snippets"

require("luasnip.loaders.from_vscode").lazy_load { paths = snippets_folder .. "/vscode_snippets/" }
require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder .. "/luasnip/" }
