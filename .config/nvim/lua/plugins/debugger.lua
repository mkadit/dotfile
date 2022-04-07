require("dapui").setup()

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStop', {text='✖', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='L', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⇔', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➤', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='✖', texthl='', linehl='', numhl=''})
