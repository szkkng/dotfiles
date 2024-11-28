local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<leader>x", "<cmd>noh<CR>", opts)
keymap("n", "<leader>,", "<cmd>w<CR>", opts)
keymap("n", "<C-S>", ":%s/", opts)

keymap("n", "-", "<C-x>", opts)
keymap("n", "+", "<C-a>", opts)

-- better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- buffers
keymap("n", "gp", "<cmd>bprevious<CR>", opts)
keymap("n", "gn", "<cmd>bnext<CR>", opts)

-- window
keymap("n", "<leader>wv", "<cmd>vs<CR>", opts)
keymap("n", "<leader>ws", "<cmd>sp<CR>", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wH", "<C-w>H", opts)
keymap("n", "<leader>wL", "<C-w>L", opts)
keymap("n", "<leader>wq", "<cmd>confirm q<CR>", opts)
keymap("n", "<M-C-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<M-C-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<M-C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<M-C-Right>", "<cmd>vertical resize +2<CR>", opts)

