local conform = {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}

return {
	{
		"zapling/mason-conform.nvim",
		event = { "BufWritePre" },
		keys = {
			{
				"<leader>p",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		dependencies = {
			require("plugins.lsp.mason"),
			conform,
		},
		opts = {},
	},
}
