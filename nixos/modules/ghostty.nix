{ ghostty, ... }:
{
  programs.ghostty = {
    enable = true;
    package = ghostty.packages.x86_64-linux.default;
    settings = {
      command = "fish -c 'tmux attach -t 0 || tmux'";
      app-notifications = "no-clipboard-copy";
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";
      confirm-close-surface = false;
      mouse-hide-while-typing = true;
      font-size = 12;
      window-padding-x = 6;
      gtk-tabs-location = "hidden";
      keybind = [
        "ctrl+equal=increase_font_size:1"
        "ctrl+minus=decrease_font_size:1"
        "ctrl+backslash=reset_font_size"
      ];
    };
  };
}
