{
  neovim-nightly-overlay,
  config,
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  xdg.configFile = {
    "nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/darwin/neovim/config";
      recursive = true;
    };
    "nvim/init.lua".enable = false;
  };
}
