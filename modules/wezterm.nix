{
  wezterm,
  pkgs,
  config,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local wezterm = require "wezterm"
      local act = wezterm.action

      local copy_mode = nil
      local search_mode = nil
      if wezterm.gui then
        copy_mode = wezterm.gui.default_key_tables().copy_mode
        local my_copy_mode = {
          { key = "/", mods = "NONE", action = act.Search { CaseSensitiveString = "" } },
          { key = "n", mods = "NONE", action = act.CopyMode "NextMatch" },
          { key = "N", mods = "NONE", action = act.CopyMode "PriorMatch" },
          {
            key = "Enter",
            mods = "NONE",
            action = act.Multiple {
              { CopyTo = "ClipboardAndPrimarySelection" },
              { CopyMode = "Close" },
            },
          },
        }
        for _, val in ipairs(my_copy_mode) do
          table.insert(copy_mode, val)
        end

        search_mode = wezterm.gui.default_key_tables().search_mode
        local my_search_mode = {
          { key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
        }
        for _, val in ipairs(my_search_mode) do
          table.insert(search_mode, val)
        end
      end

      local tabline = wezterm.plugin.require "https://github.com/michaelbrusegard/tabline.wez"
      tabline.setup {
        options = {
          icons_enabled = false,
          section_separators = {
            left = "",
            right = "",
          },
          component_separators = {
            left = "",
            right = "",
          },
          tab_separators = {
            left = "",
            right = "",
          },
        },
        sections = {
          tabline_a = { "hostname" },
          tabline_b = { "" },
          tabline_c = { "" },
          tab_active = {
            "tab_index",
            { "parent", padding = 0 },
            "/",
            { "cwd", padding = { left = 0, right = 1 } },
            { "zoomed", padding = 0 },
          },
          tab_inactive = { "tab_index", { "process", padding = { left = 0, right = 1 } } },
          tabline_x = { "ram", "cpu" },
          tabline_y = { "" },
          tabline_z = { "battery" },
        },
      }

      return {
        default_prog = { "/Users/kengo/.nix-profile/bin/fish", "-l" },
        font = wezterm.font "JetbrainsMono Nerd Font",
        font_size = 14,
        line_height = 1.2,

        color_scheme = "Catppuccin Mocha",
        force_reverse_video_cursor = true,

        use_fancy_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        show_new_tab_button_in_tab_bar = false,
        tab_max_width = 50,
        tab_bar_at_bottom = true,

        adjust_window_size_when_changing_font_size = false,
        window_close_confirmation = "NeverPrompt",
        window_background_opacity = 1.0,
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
          { key = "-", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
          { key = "|", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
          { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
          { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
          { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
          { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
          { key = "c", mods = "LEADER", action = act.ActivateCopyMode },
          { key = "L", mods = "LEADER", action = act.ShowDebugOverlay },
          {
            key = "z",
            mods = "LEADER",
            action = wezterm.action.TogglePaneZoomState,
          },
          {
            key = "LeftArrow",
            mods = "ALT",
            action = act.AdjustPaneSize { "Left", 1 },
          },
          {
            key = "DownArrow",
            mods = "ALT",
            action = act.AdjustPaneSize { "Down", 1 },
          },
          { key = "UpArrow", mods = "ALT", action = act.AdjustPaneSize { "Up", 1 } },
          {
            key = "RightArrow",
            mods = "ALT",
            action = act.AdjustPaneSize { "Right", 1 },
          },
        },
        key_tables = {
          copy_mode = copy_mode,
          search_mode = search_mode,
        },
      }
    '';
  };
}

