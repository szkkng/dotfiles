local wezterm = require "wezterm"
local scheme, _ = wezterm.color.load_scheme(os.getenv "HOME" .. "/.config/wezterm/colors/kanagawa.toml")

local SOLID_LEFT_ARROW = utf8.char(0x2590)
local SOLID_RIGHT_ARROW = utf8.char(0x258c)

function tab_title(tab_info)
  local title = tab_info.tab_title

  if title and #title > 0 then
    return title
  end

  return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = scheme.background
  local foreground = scheme.brights[1]

  if tab.is_active then
    foreground = scheme.foreground
    background = "#2a2a37"
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
end)
