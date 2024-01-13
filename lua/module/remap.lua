-- Movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Alignment
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Buffer: Without Buffer
vim.keymap.set("x", "<leader>p", [["_dp]]) -- Paste
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Delete
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]]) -- Delete

-- Buffer: With Buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]]) -- Yank
