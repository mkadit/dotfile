local fn = vim.fn
local highlight = vim.highlight
require("dapui").setup()

fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DapBreakpoint", linehl = "", numhl = "" })
fn.sign_define("DapBreakpointCondition", { text = "⇔", texthl = "DapBreakpoint", linehl = "", numhl = "" })
fn.sign_define("DapBreakpointRejected", { text = "✖", texthl = "DapBreakpoint", linehl = "", numhl = "" })
fn.sign_define("DapLogPoint", { text = "L", texthl = "DapLogPoint", linehl = "", numhl = "" })
fn.sign_define("DapStop", { text = "✖", texthl = "DapLogPoint", linehl = "", numhl = "" })
fn.sign_define("DapStopped", { text = "➤", texthl = "DapStopped", linehl = "", numhl = "" })
