local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<leader>x", "<cmd>noh<CR>")
keymap("n", "<leader>,", "<cmd>w<CR>")
keymap("n", "<C-S>", ":%s/")

keymap("n", "-", "<C-x>")
keymap("n", "+", "<C-a>")

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- buffers
keymap("n", "]b", "<cmd>bnext<CR>")
keymap("n", "[b", "<cmd>bprevious<CR>")

-- window
keymap("n", "<leader>wv", "<cmd>vs<CR>")
keymap("n", "<leader>ws", "<cmd>sp<CR>")
keymap("n", "<leader>wl", "<C-w>l")
keymap("n", "<leader>wh", "<C-w>h")
keymap("n", "<leader>wk", "<C-w>k")
keymap("n", "<leader>wj", "<C-w>j")
keymap("n", "<leader>wH", "<C-w>H")
keymap("n", "<leader>wL", "<C-w>L")
keymap("n", "<leader>wq", "<cmd>confirm q<CR>")
keymap("n", "<M-C-Up>", "<cmd>resize +2<CR>")
keymap("n", "<M-C-Down>", "<cmd>resize -2<CR>")
keymap("n", "<M-C-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<M-C-Right>", "<cmd>vertical resize +2<CR>")

-- lazy
keymap("n", "<leader>L", "<cmd>Lazy<CR>")

-- diagnostics
local diagnostic_goto = function(next, severity)
  vim.diagnostic.jump({ count = next and 1 or -1, severity = severity or nil, float = true })
end
keymap("n", "<leader>cd", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", function()
  diagnostic_goto(true)
end)
vim.keymap.set("n", "[d", function()
  diagnostic_goto(false)
end)
vim.keymap.set("n", "]w", function()
  diagnostic_goto(true, "WARN")
end)
vim.keymap.set("n", "[w", function()
  diagnostic_goto(false, "WARN")
end)
vim.keymap.set("n", "]e", function()
  diagnostic_goto(true, "ERROR")
end)
vim.keymap.set("n", "[e", function()
  diagnostic_goto(false, "ERROR")
end)
