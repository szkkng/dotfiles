local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

-- Default options:
require('kanagawa').setup({
    transparent = true, 
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
