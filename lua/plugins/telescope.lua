return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VeryLazy",
	keys = {
		{ "<leader>f", "<cmd>Telescope find_files<cr>" },
	},
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		require("plugins.treesitter"),
	},
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
