return {
	"neovim/nvim-lspconfig",
	event = "User FilePost",
	config = function()
		local cfg = require("lspconfig")

		local rust_config = {}
		local success, result = pcall(require("common").exec, "toml get -r .cargo/config.toml build.target 2>/dev/null")
		if success then
			rust_config.cargo = { target = result }
			rust_config.check = { allTargets = false }
		end

		cfg.rust_analyzer.setup({
			settings = { ["rust-analyzer"] = rust_config },
		})
		cfg.pyright.setup({})
		cfg.lua_ls.setup({})
		cfg.taplo.setup({})
		cfg.nushell.setup({})
		cfg.nil_ls.setup({})
		cfg.emmet_ls.setup({})
	end,
}
