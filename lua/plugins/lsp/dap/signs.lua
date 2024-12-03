local api = vim.api
local fn = vim.fn

-- Highlight groups
api.nvim_set_hl(0, "DapBreakpoint", { fg = "#E0FF4F" })
api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#FB3640" })
api.nvim_set_hl(0, "DapLogPoint", { fg = "#7A7D7D" })
api.nvim_set_hl(0, "DapStopped", { fg = "#61FF7E" })

-- Signs
fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DapBreakpoint" })
fn.sign_define("DapBreakpointRejected", { text = "⊗", texthl = "DapBreakpointRejected" })
fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
fn.sign_define("DapStopped", { text = "➪", texthl = "DapStopped" })
-- fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
