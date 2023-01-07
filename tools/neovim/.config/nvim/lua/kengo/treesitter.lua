local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts.setup {
  ensure_installed = { "c", "cpp", "lua" },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "lua" }
  },
  indent = {
    enable = true
  }
}
