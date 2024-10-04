{
  wezterm,
  pkgs,
  config,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
  };

  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config;
  };
}

