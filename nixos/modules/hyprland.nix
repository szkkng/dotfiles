{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      xwayland.force_zero_scaling = true;
      env = [
        "HYPRCURSOR_SIZE,32"
      ];
      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;
      };
      animations = {
        enabled = "no";
      };
      input = {
        kb_options = "ctrl:nocaps";
        repeat_rate = 40;
        repeat_delay = 300;
        follow_mouse = 1;
        sensitivity = 0.2;
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.2;
        };
      };
      monitor = [
        "eDP-1,2880x1800@60Hz,auto,2.0"
        "DP-3,highres,auto,1.5"
      ];
      "$mod" = "SUPER";
      bind = [
        "$mod, SPACE, exec, rofi -show drun"
        "$mod, q, killactive"
        "$mod, f, togglefloating"
        "$mod SHIFT, f, fullscreen"
        "$mod, RETURN, exec, foot"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        "$mod, tab, focuscurrentorlast"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, j, movewindow, d"

        "$mod, semicolon, workspace, e+1"
        "$mod, comma, workspace, e-1"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];
      binde = [
        "$mod SHIFT, left, resizeactive, -20 0"
        "$mod SHIFT, right, resizeactive, 20 0"
        "$mod SHIFT, up, resizeactive, 0 -20"
        "$mod SHIFT, down, resizeactive, 0 20"

        "$mod ALT, left, moveactive, -20 0"
        "$mod ALT, right, moveactive, 20 0"
        "$mod ALT, up, moveactive, 0 -20"
        "$mod ALT, down, moveactive, 0 20"
      ];
      bindm = [
        "$mod, mouse:272, resizewindow"
        "$mod, mouse:273, movewindow"
      ];
    };
  };
}
