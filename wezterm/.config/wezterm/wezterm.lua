local wezterm = require 'wezterm';
local scheme, _ = wezterm.color.load_scheme(os.getenv("HOME") .. '/.config/wezterm/colors/kanagawa.toml')
local act = wezterm.action;

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
    local background = scheme.background
    local foreground = scheme.brights[1]

    if tab.is_active then
      foreground = scheme.foreground
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
