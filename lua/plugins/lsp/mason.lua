return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		opts = {
			max_concurrent_installers = 10,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = {
			"MasonToolsClean",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
			"MasonToolsInstall",
			"MasonToolsInstallSync",
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				-- LSP
				"rust-analyzer",
				"pyright",
				"lua-language-server",
				"taplo",

				-- Formatters
				"stylua",
				"isort",
				"black",

				-- Linters
				"flake8",
				"selene",
				"shellcheck",
				"markdownlint",
				"yamllint",
				"jsonlint",
				"hadolint",
				"golangci-lint",

				-- Debuggers
				"codelldb",
				"debugpy",
			},
		},
	},
}
