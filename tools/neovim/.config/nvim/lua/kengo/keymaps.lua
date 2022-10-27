local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

keymap('n', '<leader>x', ':noh<CR>', opts)
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('i', 'jj', '<ESC>', opts)
keymap('n', '<C-S>', ':%s/', opts)

keymap('n', '-', '<C-x>', opts)
keymap('n', '+', '<C-a>', opts)

keymap('n', 'sv', ':vs<CR>', opts)
keymap('n', 'sh', ':sp<CR>', opts)

-- Window navigation --
keymap('n', '<C-L>', '<C-W><C-L>', opts)
keymap('n', '<C-H>', '<C-W><C-H>', opts)
keymap('n', '<C-K>', '<C-W><C-K>', opts)
keymap('n', '<C-J>', '<C-W><C-J>', opts)

-- Resize the window --
keymap('n', '<A-Up>',    ':resize +2<CR>',          opts)
keymap('n', '<A-Down>',  ':resize -2<CR>',          opts)
keymap('n', '<A-Left>',  ':vertical resize -2<CR>', opts)
keymap('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-- Tab navigation --
keymap('n', 'tn', ':tabnew<CR>', opts)
keymap('n', 'tx', ':tabc<CR>', opts)
keymap('n', 'tl', ':tabnext<CR>', opts)
keymap('n', 'th', ':tabprev<CR>', opts)
keymap('n', 'to', ':tabo<CR>', opts)

-- Explorer -- 
keymap('n', '<leader>nn', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>nr', ':NvimTreeRefresh<CR>', opts)

-- Terminal --
-- keymap('n', '<leader>tt', ':ToggleTerm size=15<CR>', opts)
-- keymap('n', '<leader>te', ':TermExec cmd="run.sh"<CR>', opts)
-- keymap('t', '<esc>', [[<C-\><C-n>]], opts)
keymap('n', '<leader>te', ':!tmux split-window -v -p 30<CR> :!tmux send-keys -t 1 run.sh Enter<CR><CR>', opts)

-- neovide --
vim.g.neovide_input_use_logo = 1
keymap('', '<D-v>', '+p<CR>', opts)
keymap('!', '<D-v>', '<C-R>+', opts)
keymap('t', '<D-v>', '<C-R>+', opts)
keymap('v', '<D-v>', '<C-R>+', opts)

-- Neogit --
keymap('n', '<leader>gi', ':Neogit<CR>', opts)
