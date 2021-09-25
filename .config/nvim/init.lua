--TODO: Try other LSP auto installer
--TODO: Clean up config
-- Packer
require "impatient"
require "packer_compiled"
require "modules.packer.bootstrap"
require "modules.packer"

-- impatient

-- General Settings
require "modules.settings"

-- lsp
require "modules.lsp"
-- require('modules.lsp.efm-config')
require "modules.lsp.lsp-trouble"
require "modules.lsp.diagnostic"

-- Plugin Settings
require "plugins.formatter"
require "plugins.autopairs"
require "plugins.barbar"
require "plugins.bufresize"
require "plugins.colorizer"
require "plugins.completion"
require "plugins.diffview"
require "plugins.emmet"
require "plugins.galaxyline"
require "plugins.kommentary"
require "plugins.neogit"
require "plugins.neuron"
-- require "plugins.nvimTree"
require "plugins.rest"
require "plugins.startify"
require "plugins.telescope"
require "plugins.treesitter"
require "plugins.trueZen"
require "plugins.whichkey"

-- Mappings
require "modules.mappings"
