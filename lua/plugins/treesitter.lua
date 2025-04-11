return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "rust", "python", "c", "lua", "markdown", "latex", "toml", "html", "json", "yaml" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
