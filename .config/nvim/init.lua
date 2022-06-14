require "package.bootstrap"
require("impatient").enable_profile()
require "package.deps"

vim.g.do_filetype_lua = 1

vim.cmd [[
 runtime! lua/modules/options.lua
 runtime! lua/modules/mappings.lua
 runtime! lua/modules/commands.lua
]]
