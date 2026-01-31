vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.relativenumber = true
vim.o.number = true
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.g.mapleader = ","

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
