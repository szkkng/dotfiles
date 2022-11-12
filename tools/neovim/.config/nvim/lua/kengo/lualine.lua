require('lualine').setup {
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
