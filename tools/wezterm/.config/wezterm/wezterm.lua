local wezterm = require 'wezterm';

return {

  color_scheme = "iceberg-dark",

  font = wezterm.font ("Fira Code"),
  font_size = 14,

  tab_bar_at_bottom = true,

  window_background_opacity = 0.95,
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  default_prog = { '/bin/zsh', '-l', '-c', "tmux a -t 0 || tmux" },

}
