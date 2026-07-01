{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  xdg.configFile."yazi/theme.toml".source = ./kanagawa-paper.toml;
}
