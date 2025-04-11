return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>dm",
			function()
				require("dap").toggle_breakpoint()
			end,
			"Toggle breakpoint",
		},
		{
			"<leader>dd",
			function()
				require("dap").continue()
			end,
			"Continue",
		},
		{
			"<leader>dl",
			function()
				require("dap").step_over()
			end,
			"Step over",
		},
		{
			"<leader>dj",
			function()
				require("dap").step_into()
			end,
			"Step into",
		},
		{
			"<leader>dk",
			function()
				require("dap").step_out()
			end,
			"Step out",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			"Open REPL",
		},
		{
			"<leader>dD",
			function()
				require("dap").run_last()
			end,
			"Run last",
		},
		{
			"<leader>dk",
			function()
				require("dap").terminate()
			end,
			"Terminate/Kill",
		},
	},
	config = function()
		require("plugins.lsp.dap.adpt")
		require("plugins.lsp.dap.cfg")
		require("plugins.lsp.dap.signs")
	end,
}
