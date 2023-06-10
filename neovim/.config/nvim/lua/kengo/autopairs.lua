local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

require('nvim-autopairs').setup {
}
