return {
	require("plugins.ui.themes"),
	require("plugins.ui.oil"),
	require("plugins.ui.bufferline"),
	require("plugins.ui.trouble"),
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				keys = {
					{ "<leader>nn", ":Telescope notify<CR>" },
					{
						"<leader>nd",
						function()
							require("notify").dismiss({ pending = true, silent = true })
						end,
					},
				},
			},
		},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		main = "ibl",
		opts = {
			indent = { char = "▏" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPost",
		dependencies = {
			require("plugins.treesitter"),
		},
		opts = {
			max_lines = 3,
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		event = "BufReadPost",
		dependencies = { require("plugins.treesitter"), require("plugins.lsp.dap") },
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim", require("plugins.telescope") },
		event = "BufReadPost",
		keys = {
			{ "<leader>t", ":TodoTelescope<CR>" },
		},
		opts = {
			keywords = {
				FEAT = { icon = "🚀", color = "feat" },
			},
			colors = {
				feat = { "#f5c359" },
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		keys = {
			{
				"<leader>dt",
				function()
					require("dapui").toggle({ reset = true })
				end,
				"Toggle DAP UI",
			},
		},
		dependencies = {
			require("plugins.lsp.dap"),
			"nvim-neotest/nvim-nio",
		},
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.ui.lualine")
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPost",
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.icons",
		},
		opts = {},
	},
	{
		"mvllow/modes.nvim",
		event = "BufReadPost",
		opts = {},
	},
	{
		"sphamba/smear-cursor.nvim",
		event = "BufReadPost",
		opts = {},
	},
}
