require("dapui").setup()
local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStop', {text='✖', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='L', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⇔', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➤', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='✖', texthl='', linehl='', numhl=''})
