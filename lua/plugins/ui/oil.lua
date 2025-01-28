return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	lazy = false,
	keys = {
		{ "<leader>o", "<cmd>Oil --float<CR>", desc = "Open oil" },
	},
	opts = {
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<Esc>"] = { "actions.close", mode = "n" },
			["<Tab>"] = "actions.select",
		},
	},
}
