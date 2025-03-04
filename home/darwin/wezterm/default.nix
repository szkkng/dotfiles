{
  wezterm,
  config,
  pkgs,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
  };

  xdg.configFile = {
    "wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/darwin/wezterm/config";
      recursive = true;
    };
    "wezterm/wezterm.lua".enable = false;
  };
}
