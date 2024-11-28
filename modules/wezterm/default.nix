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
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/wezterm/config";
      recursive = true;
    };
    # https://github.com/nix-community/home-manager/issues/1807#issuecomment-1740960646
    "wezterm/wezterm.lua".enable = false;
  };
}
