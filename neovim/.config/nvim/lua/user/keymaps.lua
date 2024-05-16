local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<leader>x", ":noh<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<C-S>", ":%s/", opts)

keymap("n", "-", "<C-x>", opts)
keymap("n", "+", "<C-a>", opts)

keymap("n", "sv", ":vs<CR>", opts)
keymap("n", "sh", ":sp<CR>", opts)

-- Stay in indent mode --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Window navigation --
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-J>", "<C-W><C-J>", opts)

-- Resize the window --
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Tab navigation --
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "tx", ":tabc<CR>", opts)
keymap("n", "tl", ":tabnext<CR>", opts)
keymap("n", "th", ":tabprev<CR>", opts)
keymap("n", "to", ":tabo<CR>", opts)

-- Terminal --
keymap("t", "<esc>", [[<C-\><C-n>]], opts)
keymap("t", "jk", [[<C-\><C-n>]], opts)
keymap("n", "<leader>to", ":ToggleTerm<CR>", opts)
keymap("n", "<leader>te", ':TermExec cmd="run.sh"<CR>', opts)
-- keymap('n', '<leader>te', ':!tmux split-window -v -p 30<CR> :!tmux send-keys -t 1 run.sh Enter<CR><CR>', opts)

-- Trouble --
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- Neovide --
vim.g.neovide_input_use_logo = 1
keymap("", "<D-v>", "+p<CR>", opts)
keymap("!", "<D-v>", "<C-R>+", opts)
keymap("t", "<D-v>", "<C-R>+", opts)
keymap("v", "<D-v>", "<C-R>+", opts)
