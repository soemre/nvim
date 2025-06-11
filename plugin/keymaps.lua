local hjkl_to_flag = {
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

local set = vim.keymap.set

-- Configue

-- Line
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "<", "<gv")
set("v", ">", ">gv")
set("v", "<Tab>", ">gv")
set("v", "<S-Tab>", "<gv")

--
set("n", "<M-j>", "jzz")
set("n", "<M-k>", "kzz")

-- Panes
set("n", "<C-w>q", "<cmd>hide<CR>") -- Require `:q` to close nvim
set("n", "<C-h>", function()
	move_window("h")
end)
set("n", "<C-j>", function()
	move_window("j")
end)
set("n", "<C-k>", function()
	move_window("k")
end)
set("n", "<C-l>", function()
	move_window("l")
end)
set("n", "<C-a-h>", "<C-w>H")
set("n", "<C-a-j>", "<C-w>J")
set("n", "<C-a-k>", "<C-w>K")
set("n", "<C-a-l>", "<C-w>L")

-- Switch Buffers
set("n", "<Tab>", "gt")
set("n", "<S-Tab>", "gT")

-- Symbol Operations
set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- Inlay hints
set({ "n", "v" }, "<leader>L", function()
	vim.lsp.inlay_hint.enable(vim.lsp.inlay_hint.is_enabled())
end, { silent = true })
