local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts.setup {
  ensure_installed = { "c", "cpp", "lua" },
  highlight = {
    enable = true,
    disable = { "lua" },
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}
