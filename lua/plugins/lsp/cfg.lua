return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	keys = {
		{ "<leader>l", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>" },
	},
	config = function()
		local cfg = require("lspconfig")

		local rust_config = {}
		local success, result, _ = require("common").exec("toml get -r .cargo/config.toml build.target")
		if success == 0 then
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
		cfg.clangd.setup({})
		cfg.dartls.setup({})
	end,
}
