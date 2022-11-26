local custom_iceberg = require'lualine.themes.iceberg_dark'

custom_iceberg.normal.c.bg = nil
-- custom_iceberg.inactive.a.bg = nil
-- custom_iceberg.inactive.b.bg = nil
custom_iceberg.inactive.c.bg = nil
-- custom_iceberg.normal.b.bg = "1f1f28"

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
