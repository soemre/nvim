return {
	"neovim/nvim-lspconfig",
	event = "User FilePost",
	config = function()
		local cfg = require("lspconfig")

		cfg.rust_analyzer.setup({})
		cfg.pyright.setup({})
		cfg.lua_ls.setup({})
		cfg.taplo.setup({})
		cfg.nushell.setup({})
		cfg.nil_ls.setup({})
		cfg.emmet_ls.setup({})
	end,
}
