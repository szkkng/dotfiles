local wezterm = require 'wezterm';

return {

  color_scheme = "tokyonight",

  font = wezterm.font ("Fira Code"),
  font_size = 14,

  tab_bar_at_bottom = true,

  window_background_opacity = 0.85,
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  default_prog = { '/bin/zsh', '-l', '-c', "tmux a -t 0 || tmux" },

}
