local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- local r = ls.restore_node
-- local events = require "luasnip.util.events"
-- local ai = require "luasnip.nodes.absolute_indexer"
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l

local snippets, autosnippets = {}, {}

-- local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
-- local file_pattern = "*.lua"

local msS = s("msS", { t "Test Snippet" })
ls.add_snippets("all", { msS })

-- table.insert(snippets, msS)

ls.add_snippets("all", {
    s("todo", {
        c(1, {
            t "TODO: ",
            t "ERROR: ",
            t "INFO: ",
            t "WARNING: ",
            t "FIXME: ",
        }),
    }),

    s("time", {
        c(1, {
            f(function()
                return os.date "%D - %H:%M"
            end),
            f(function()
                return os.date "%D"
            end),
            f(function()
                return os.date "%H:%M"
            end),
        }),
    }),
})

return snippets, autosnippets
