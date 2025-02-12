{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # monitor = ",preferred,auto,1";
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
