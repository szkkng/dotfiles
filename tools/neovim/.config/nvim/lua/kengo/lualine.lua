local custom_iceberg = require'lualine.themes.iceberg_dark'

custom_iceberg.normal.c.bg = nil

require('lualine').setup {
  options = {
    theme = custom_iceberg
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
