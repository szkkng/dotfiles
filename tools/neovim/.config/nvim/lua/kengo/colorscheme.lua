local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

tokyonight.setup({
  style = "moon",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
