--TODO: Clean up config
-- impatient
-- require "impatient"
-- require "packer_compiled"

-- Packer
require "modules.packer.bootstrap"
require "modules.packer"

-- General Settings
require "modules.settings"

-- lsp
require "modules.lsp"
-- require('modules.lsp.efm-config')
require "modules.lsp.lsp-trouble"
require "modules.lsp.diagnostic"

-- Plugin Settings
require "plugins.autopairs"
require "plugins.bufferline"
require "plugins.bufresize"
require "plugins.colorizer"
require "plugins.completion"
require "plugins.debugger"
require "plugins.diffview"
require "plugins.emmet"
require "plugins.formatter"
require "plugins.galaxyline"
require "plugins.kommentary"
require "plugins.neogit"
require "plugins.nvimTree"
require "plugins.rest"
require "plugins.startify"
-- require "plugins.telescope"
-- require "plugins.treesitter"
-- require "plugins.trueZen"
-- require "plugins.whichkey"

-- Mappings
-- require "modules.mappings"
