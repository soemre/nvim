return {
	"numToStr/Comment.nvim",
	keys = {
		{ (os.getenv("TMUX") and "<C-_>" or "<C-/>"), "gc", mode = "v", remap = true, silent = true },
		{
			(os.getenv("TMUX") and "<C-_>" or "<C-/>"),
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
