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
}
