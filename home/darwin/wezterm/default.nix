{
  wezterm,
  pkgs,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
    extraConfig = # lua
      ''
        local wezterm = require("wezterm")

        return {
          default_prog = { "${pkgs.fish}/bin/fish", "-c", "tmux a -t 0 || tmux" },
          color_scheme = "Catppuccin Mocha",
          font = wezterm.font("JetbrainsMono Nerd Font"),
          font_size = 14,
          line_height = 1.2,
          enable_tab_bar = false,

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
        }
      '';
  };
}
