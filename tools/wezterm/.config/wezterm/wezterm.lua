local wezterm = require 'wezterm';

return {

  force_reverse_video_cursor = true,

  colors = {
    foreground = "#c8d3f5",
    background = "#222436",
    cursor_bg = "#c8d3f5",
    cursor_border = "#c8d3f5",
    cursor_fg = "#222436",
    selection_bg = "#3654a7",
    selection_fg = "#c8d3f5",

    ansi = { "#1b1d2b", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#828bb8" },
    brights = { "#444a73", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#c8d3f5" },
  },

  font = wezterm.font ("FiraCode Nerd Font"),
  font_size = 14,

  tab_bar_at_bottom = true,

  window_background_opacity = 0.85,
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  default_prog = { '/opt/homebrew/bin/fish', '-l', '-c', "tmux a -t 0 || tmux" },

}
