local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_ok, custom_kanagawa = pcall(require, "lualine.themes.kanagawa")
if not status_ok then
  return
end

custom_kanagawa.inactive.c.bg = nil

lualine.setup {
  options = {
    theme = custom_kanagawa,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
}
