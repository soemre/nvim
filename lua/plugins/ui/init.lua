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
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = { char = "▏" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufEnter",
		dependencies = {
			require("plugins.treesitter"),
		},
		opts = {},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		event = "BufEnter",
		dependencies = {
			require("plugins.treesitter"),
			require("plugins.lsp.dap"),
		},
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
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
	require("plugins.ui.lualine"),
	require("plugins.ui.bufferline"),
	require("plugins.ui.trouble"),
}
