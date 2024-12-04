return {
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
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<leader>e",
				function()
					local tree = require("nvim-tree.api").tree
					local dap = require("dapui")
					if tree.is_tree_buf() then
						tree.close()
					else
						tree.focus()
						dap.close()
					end
				end,
			},
		},
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		main = "ibl",
		opts = {
			indent = { char = "▏" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		dependencies = {
			require("plugins.treesitter"),
		},
		opts = {},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		event = "BufRead",
		dependencies = { require("plugins.treesitter"), require("plugins.lsp.dap") },
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim", require("plugins.telescope") },
		event = "VeryLazy",
		keys = {
			{ "<leader>t", ":TodoTelescope<CR>" },
		},
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		keys = {
			{
				"<leader>dt",
				function()
					require("nvim-tree.api").tree.close()
					require("dapui").toggle({
						reset = true,
					})
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
	require("plugins.ui.themes"),
	require("plugins.ui.bufferline"),
	require("plugins.ui.trouble"),
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.ui.lualine")
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufRead",
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
}
