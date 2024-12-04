local opt = vim.opt
local lsp = vim.lsp
local cmd = vim.cmd
local g = vim.g

-- Built-in plugins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Appearance
opt.termguicolors = true
cmd.colorscheme("alduin")
opt.fillchars = { eob = " " }
lsp.inlay_hint.enable()
opt.colorcolumn = "100"
opt.guicursor = ""
opt.nu = true
opt.relativenumber = true
opt.wrap = false

-- Default Tab Settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Functionality
opt.scrolloff = 8
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.updatetime = 50
