local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local custom_kanagawa = require'lualine.themes.kanagawa'

custom_kanagawa.normal.c.bg = nil
custom_kanagawa.inactive.c.bg = nil

lualine.setup {
  options = {
    theme = custom_kanagawa
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 1,
      }
    },
    lualine_z = {'tabs'},
  }
}
