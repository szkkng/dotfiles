local wezterm = require 'wezterm';

local SOLID_LEFT_ARROW = utf8.char(0x2590)
local SOLID_RIGHT_ARROW = utf8.char(0x258c)

function tab_title(tab_info)
  local title = tab_info.tab_title

  if title and #title > 0 then
    return title
  end

  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local background = '#1f1f28'
    local foreground = '#727169'

    if tab.is_active then
      foreground = '#dcd7ba'
      background = '#2a2a37'
    end

    local edge_foreground = background
    local edge_background = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

return {
  default_prog = { '/opt/homebrew/bin/fish', '-l' },
  font = wezterm.font ("FiraCode Nerd Font"),
  font_size = 12,
  line_height = 1.2,

  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,
  tab_max_width = 50,

  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.9,
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  -- Copyright (c) 2021 Tommaso Laurenzi
  -- Released under the MIT license.
  -- https://github.com/rebelot/kanagawa.nvim/blob/master/LICENSE
  force_reverse_video_cursor = true,
  colors = {
    foreground = "#dcd7ba",
    background = "#1f1f28",

    cursor_bg = "#c8c093",
    cursor_fg = "#c8c093",
    cursor_border = "#c8c093",

    selection_fg = "#c8c093",
    selection_bg = "#2d4f67",

    tab_bar = {
      background = '#1f1f28'
    },

    scrollbar_thumb = "#16161d",
    split = "#16161d",

    ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
    brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
    indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  },
}
