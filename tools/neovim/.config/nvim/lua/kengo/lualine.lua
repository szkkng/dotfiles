local custom_kanagawa = require'lualine.themes.kanagawa'

custom_kanagawa.normal.c.bg = nil
custom_kanagawa.inactive.c.bg = nil

require('lualine').setup {
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
