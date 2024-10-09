{
  wezterm,
  pkgs,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
  };

  xdg.configFile."wezterm/wezterm.lua".source = ./config/wezterm.lua;
}

