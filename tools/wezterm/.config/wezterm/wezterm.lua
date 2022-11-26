local wezterm = require 'wezterm';

return {

  color_scheme = "iceberg-dark",
  force_reverse_video_cursor = true,

  font = wezterm.font ("FiraCode Nerd Font"),
  font_size = 14,

  tab_bar_at_bottom = true,

  window_background_opacity = 1.0,
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  default_prog = { '/bin/zsh', '-l', '-c', "tmux a -t 0 || tmux" },

}
