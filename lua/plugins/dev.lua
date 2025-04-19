return {
	{
		"soemre/commentless.nvim",
        -- stylua: ignore
		keys = {
			{ "<leader>/", mode = "n", function() require("commentless").toggle() end, desc = "Toggle Comments"},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}
