local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<leader>x", ":noh<CR>", opts)
keymap("n", "<leader>,", ":w<CR>", opts)
keymap("n", "<C-S>", ":%s/", opts)

keymap("n", "-", "<C-x>", opts)
keymap("n", "+", "<C-a>", opts)

-- Stay in indent mode --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Window navigation --
keymap("n", "<leader>wv", ":vs<CR>", opts)
keymap("n", "<leader>wh", ":sp<CR>", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)

-- Resize the window --
keymap("n", "<m-Up>", ":resize +2<CR>", opts)
keymap("n", "<m-Down>", ":resize -2<CR>", opts)
keymap("n", "<m-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<m-Right>", ":vertical resize +2<CR>", opts)

-- Tab navigation --
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "tx", ":tabc<CR>", opts)
keymap("n", "tl", ":tabnext<CR>", opts)
keymap("n", "th", ":tabprev<CR>", opts)
keymap("n", "to", ":tabo<CR>", opts)
