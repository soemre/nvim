return {
	"neovim/nvim-lspconfig",
	event = "User FilePost",
	config = function()
		local cfg = require("lspconfig")

		cfg.rust_analyzer.setup({})
		cfg.pyright.setup({})
		cfg.lua_ls.setup({})
		cfg.taplo.setup({})
	end,
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = {
				require("plugins.lsp.mason"),
			},
			opts = {
				automatic_installation = true,
			},
		},
	},
}
