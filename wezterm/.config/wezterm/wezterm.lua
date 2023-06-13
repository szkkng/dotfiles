local wezterm = require 'wezterm';
local scheme, _ = wezterm.color.load_scheme(os.getenv("HOME") .. '/.config/wezterm/colors/kanagawa.toml')
local act = wezterm.action;
require 'on'

return {
  default_prog = { '/opt/homebrew/bin/fish', '-l' },
  font = wezterm.font ("FiraCode Nerd Font"),
  font_size = 14,
  line_height = 1.2,

  color_scheme = 'kanagawa',
  colors = {
    tab_bar = {
      background = scheme.background,
    },
  },

  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,
  tab_max_width = 50,

  adjust_window_size_when_changing_font_size = false,
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.9,
  window_decorations = "RESIZE",
  window_padding = {
    left = 10,
    right = 10,
    top = 5,
    bottom = 5,
  },

  scrollback_lines = 1000,

  leader = { key = "j", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '|', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'L', mods = 'LEADER', action = act.ShowDebugOverlay },
  },
}
