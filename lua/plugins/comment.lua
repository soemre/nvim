return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	keys = {
		{ "<C-_>", "gc", mode = "v", remap = true, silent = true },
		{
			"<C-_>",
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			mode = { "n", "i" },
			remap = true,
			silent = true,
		},
	},
	opts = {},
}
