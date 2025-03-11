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
				"rust-analyzer", -- Rust
				"pyright", -- Python
				"lua-language-server", -- Lua
				"taplo", -- Toml
				"nil", -- Nix
				"emmet-ls", -- HTML

				-- Formatters
				"stylua", -- Lua
				"isort", -- Python
				"black", -- Python
				"alejandra", -- Nix
				"prettier", -- HTML

				-- Linters
				"flake8", -- Python
				"selene", -- Lua
				"shellcheck", -- Bash
				"markdownlint", -- Markdown
				"yamllint", -- Yaml
				"jsonlint", -- Json
				"hadolint", -- Docker
				"golangci-lint", -- Go

				-- Debuggers
				"codelldb",
				"debugpy", -- Python
			},
		},
	},
}
