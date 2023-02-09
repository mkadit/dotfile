local M = {}

-- Load setup
function M.setup(opts)
  require("core.plugins")
  require("config").setup(opts)
end

return M
