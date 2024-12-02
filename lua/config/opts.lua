local opt = vim.opt
local lsp = vim.lsp
local cmd = vim.cmd
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
opt.termguicolors = true

cmd.colorscheme ("rose-pine-main")
lsp.inlay_hint.enable()

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- opt.hlsearch = false
-- opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
-- opt.signcolumn = "yes"
-- opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "100"

-- There is no need to show the mode, after using another plugin for it (Lualine)
opt.showmode = false

opt.fillchars = { eob = " "}
