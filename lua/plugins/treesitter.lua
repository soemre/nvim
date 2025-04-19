return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"rust",
				"python",
				"c",
				"cpp",
				"lua",
				"markdown",
				"latex",
				"toml",
				"html",
				"json",
				"yaml",
				"dart",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
