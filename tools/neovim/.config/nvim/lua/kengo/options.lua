local options = {
    clipboard      = 'unnamedplus',
    number         = true,
    relativenumber = true,
    cursorline     = true,
    wrap           = false,
    expandtab      = true,
    incsearch      = true,
    tabstop        = 4,
    ignorecase     = true,
    smartcase      = true,
    hlsearch       = true,
    swapfile       = false,
    splitbelow     = true,
    splitright     = true,
    scrolloff      = 4,
    errorbells     = false,
    shiftwidth     = 4,
    numberwidth    = 4,
    termguicolors  = true,
    colorcolumn    = '80',
    showmode       = false,
    showtabline    = 2,
    signcolumn     = 'yes',
    mouse          = '',
    completeopt    = { "menuone", "noselect" },
    pumheight      = 10,
    cmdheight      = 0,
    pumblend       = 30,
    guifont        = 'FiraCode Nerd Font',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

