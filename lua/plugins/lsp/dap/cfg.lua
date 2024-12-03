local dap = require("dap")
local fn = vim.fn

dap.configurations.c = {
	{
		type = "codelldb",
		name = "Launch file",
		request = "launch",
		program = function()
			return fn.input("Path to executable: ", fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = true,
	},
}

dap.configurations.cpp = dap.configurations.c

dap.configurations.rust = {
	{
		type = "codelldb",
		name = "Launch",
		request = "launch",
		program = function()
			fn.system("cargo build -q")
			local crate = fn.system('cargo metadata --format-version 1 | jq -r ".packages[0].name"')
			crate = string.gsub(crate, "%s+", "")

			return fn.getcwd() .. "/target/debug/" .. crate
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = true,
	},
	{
		type = "codelldb",
		name = "Launch Crate",
		request = "launch",
		program = function()
			local crate = fn.input("Crate: ", "", "file")
			crate = string.gsub(crate, "%s+", "")

			fn.system("cargo build -q --bin" .. crate)

			return fn.getcwd() .. "/target/debug/" .. crate
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = true,
	},
	unpack(dap.configurations.c),
}

dap.configurations.python = {
	{
		type = "debugpy",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = fn.getcwd()
			if fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}
