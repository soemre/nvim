require("dapui").setup()

vim.keymap.set("n", "<leader>dv", function() require("dapui").toggle()  end)
