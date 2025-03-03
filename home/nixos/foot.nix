{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish -c 'tmux a -t 0 || tmux'";
        font = "JetBrains Mono Nerd Font:size=10";
        dpi-aware = "yes";
        pad = "6x6";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
