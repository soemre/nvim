local function map_keys(keymaps)
	for _, map in ipairs(keymaps) do
		local mode, lhs, rhs, options = unpack(map)
		vim.keymap.set(mode, lhs, rhs, options)
	end
end

hjkl_to_flag = {
	h = "L",
	j = "D",
	k = "U",
	l = "R",
}

local function move_window(direction)
	if os.getenv("TMUX") == nil then
		vim.cmd.wincmd(direction)
	end

	local current_window = vim.fn.winnr()

	-- Try moving the window
	vim.cmd.wincmd(direction)

	-- Check if we are still in the same window
	if vim.fn.winnr() == current_window then
		os.execute("tmux select-pane -" .. hjkl_to_flag[direction])
	end
end

--stylua: ignore
map_keys({
	-- Line
	{ "v", "J", ":m '>+1<CR>gv=gv" },
	{ "v", "K", ":m '<-2<CR>gv=gv" },
	{ "v", "<", "<gv" },
	{ "v", ">", ">gv" },

	-- Panes
	{ "n", "<C-h>", function() move_window("h") end },
	{ "n", "<C-j>", function() move_window("j") end },
	{ "n", "<C-k>", function() move_window("k") end },
	{ "n", "<C-l>", function() move_window("l") end },
	{ "n", "<C-a-h>", "<C-w>H" },
	{ "n", "<C-a-j>", "<C-w>J" },
	{ "n", "<C-a-k>", "<C-w>K" },
	{ "n", "<C-a-l>", "<C-w>L" },

	-- Switch Buffers
	{ "n", "<Tab>", "gt" },
	{ "n", "<S-Tab>", "gT" },

	-- Go to definition
	{ "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },

	-- Inlay hints
	{
		{ "n", "v" },
		"<leader>L",
		function()
			vim.lsp.inlay_hint.enable(vim.lsp.inlay_hint.is_enabled())
		end,
		{ silent = true },
	},
})
