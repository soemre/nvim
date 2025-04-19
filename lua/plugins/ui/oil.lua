local function is_last_buf()
	return not pcall(vim.cmd.bprev)
end

return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	lazy = false,
	keys = {
		{
			"<leader>o",
			function()
				if is_last_buf() then
					return
				end
				require("oil").toggle_float()
			end,
			desc = "Open oil",
		},
	},
	opts = {
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<Esc>"] = {
				callback = function()
					if is_last_buf() then
						return
					end
					local actions = require("oil.actions")
					actions.close.callback({})
				end,
				mode = "n",
			},
			["<C-c>"] = {
				callback = function()
					require("oil.config").keymaps["<Esc>"].callback()
				end,
				mode = "n",
			},
			["<Tab>"] = "actions.select",
		},
	},
}
