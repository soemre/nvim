local dap = require("dap")

-- Compiled
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
		-- detached = false, -- On windows it might be needed
	},
}

-- Python
dap.adapters.debugpy = {
	type = "executable",
	command = "debugpy-adapter",
}
