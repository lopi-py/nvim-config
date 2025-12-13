vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.foldtext = ""
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.swapfile = false
vim.o.updatetime = 200
vim.o.laststatus = 3

vim.o.list = true
vim.o.mouse = ""
vim.o.showmode = false

vim.opt.listchars = { extends = "»", precedes = "«", trail = "·" }
vim.opt.fillchars = { fold = " ", diff = "╱" }
