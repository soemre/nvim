local M = {}

function M.exec(command)
	local tmpfile = os.tmpname()
	local exit = os.execute(command .. " > " .. tmpfile .. " 2> " .. tmpfile .. ".err")

	local stdout_file = io.open(tmpfile)
	local stdout = stdout_file:read("*all")

	local stderr_file = io.open(tmpfile .. ".err")
	local stderr = stderr_file:read("*all")

	stdout_file:close()
	stderr_file:close()

	return exit, stdout, stderr
end

return M
