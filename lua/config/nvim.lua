vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.number = true

vim.keymap.set("n", "<Leader>a", "ggVG", { desc = "Select all" })
vim.keymap.set("n", "<Leader>s", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<Leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<Leader>Q", ":qa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Tree" })

vim.opt.numberwidth = 4

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

