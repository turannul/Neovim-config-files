-- Set leader key to ,
vim.g.mapleader = ","  -- Leader key
vim.g.maplocalleader = ","  -- Local leader key
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

-- Setting for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable line numbers
vim.wo.number = true

-- Select all text on Leader (,) A key
vim.keymap.set("n", "<Leader>a", "ggVG", { desc = "Select all" })
-- Save on Leader (,) S key
vim.keymap.set("n", "<Leader>s", ":w<CR>", { desc = "Save" })
-- Quit on Leader (,) q key
vim.keymap.set("n", "<Leader>q", ":q<CR>", { desc = "Quit" })
-- Quit all on Leader (,) Q key
vim.keymap.set("n", "<Leader>Q", ":qa<CR>", { desc = "Quit all" })
-- Toggle tree on Leader (,) e key
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Tree" })

-- Set the number width for consistency
vim.opt.numberwidth = 4

-- Disable ruby and perl providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Ignore case
-- vim.o.ignorecase = true
