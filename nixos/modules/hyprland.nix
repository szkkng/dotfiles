{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [
        "eDP-1,highres,auto,1.5"
        "DP-3,highres,auto,1.5"
      ];
      "$mod" = "SUPER";
      "$terminal" = "wezterm";
      bind = [
        "$mod, SPACE, exec, rofi -show drun"
        "$mod, Q, killactive"
        "$mod, M, exit"
        # "$mod, V, togglefloating"
        # "$mod, J, togglesplit"
        # "$mod, left, movefocus, l"
        # "$mod, right, movefocus, r"
        # "$mod, up, movefocus, u"
        # "$mod, down, movefocus, d"
      ];
    };
  };
}
