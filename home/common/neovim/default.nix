{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    withNodeJs = true;
    extraPackages = with pkgs; [
      gcc
      cmake
      gnumake
      lua-language-server
      stylua
    ];
  };

  xdg.configFile = {
    "nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/common/neovim/config";
      recursive = true;
    };
    "nvim/init.lua".enable = false;
  };
}
