return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	lazy = false,
	keys = {
		{
			"<leader>o",
			function()
				if not pcall(vim.cmd.bprev) then
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
					if not pcall(vim.cmd.bprev) then
						return
					end
					local actions = require("oil.actions")
					actions.close.callback({
						exit_if_last_buf = true,
					})
				end,
				mode = "n",
			},
			["<C-c>"] = function()
				require("oil.config").keymaps["<Esc>"].callback()
			end,
			mode = "n",
			["<Tab>"] = "actions.select",
		},
	},
}
