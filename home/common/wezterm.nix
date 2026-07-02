{
  pkgs,
  ...
}:
let
  kanagawaPaperInk = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/thesimonho/kanagawa-paper.nvim/25d3656a187c9596647b73abb71521f0339616c7/extras/wezterm/kanagawa-paper-ink.toml";
    hash = "sha256-ts9gq5BFnGrRigj6q7z9cldHvfePr30C4E9KK+KpjXI=";
  };
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = # lua
      ''
        local wezterm = require("wezterm")

        return {
          default_prog = { "${pkgs.fish}/bin/fish" },
          color_schemes = {
            ["Kanagawa Paper Ink"] = wezterm.color.load_scheme("${kanagawaPaperInk}"),
          },
          color_scheme = "Kanagawa Paper Ink",
          font = wezterm.font("JetbrainsMono Nerd Font"),
          font_size = 14,
          line_height = 1.2,
          enable_tab_bar = false,

          adjust_window_size_when_changing_font_size = false,
          window_close_confirmation = "NeverPrompt",
          window_decorations = "RESIZE",
          window_padding = {
            left = 10,
            right = 10,
            top = 5,
            bottom = 5,
          },

          scrollback_lines = 1000,
          send_composed_key_when_left_alt_is_pressed = false,
          send_composed_key_when_right_alt_is_pressed = false,
        }
      '';
  };
}
