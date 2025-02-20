{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      xwayland.force_zero_scaling = true;
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
        "eDP-1,highres,auto,1.5"
        "DP-3,highres,auto,1.5"
      ];
      "$mainMod" = "SUPER";
      "$terminal" = "wezterm";
      bind = [
        "$mainMod, SPACE, exec, rofi -show drun"
        "$mainMod, q, killactive"
        "$mainMod, f, togglefloating"
        "$mainMod SHIFT, f, fullscreen"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod, tab, focuscurrentorlast"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        "$mainMod, semicolon, workspace, e+1"
        "$mainMod, comma, workspace, e-1"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
      ];
      binde = [
        "$mainMod SHIFT, left, resizeactive, -20 0"
        "$mainMod SHIFT, right, resizeactive, 20 0"
        "$mainMod SHIFT, up, resizeactive, 0 -20"
        "$mainMod SHIFT, down, resizeactive, 0 20"

        "$mainMod ALT, left, moveactive, -20 0"
        "$mainMod ALT, right, moveactive, 20 0"
        "$mainMod ALT, up, moveactive, 0 -20"
        "$mainMod ALT, down, moveactive, 0 20"
      ];
      bindm = [
        "$mainMod, mouse:272, resizewindow"
        "$mainMod, mouse:273, movewindow"
      ];
    };
  };
}
