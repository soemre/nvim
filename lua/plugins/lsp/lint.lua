return {
	"mfussenegger/nvim-lint",
	config = function()
		local l = require("lint")
		l.linters_by_ft = {
			python = { "flake8" },
			lua = { "selene" },
			sh = { "shellcheck" },
			markdown = { "markdownlint" },
			yaml = { "yamllint" },
			json = { "jsonlint" },
			dockerfile = { "hadolint" },
			go = { "golangci-lint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				l.try_lint()
			end,
		})
	end,
}
