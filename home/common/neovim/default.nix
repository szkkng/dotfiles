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
    extraPackages = with pkgs; [
      gcc
      cmake
      gnumake

      # lsp
      nil
      lua-language-server

      # formatter
      stylua
      gersemi
      prettierd
      actionlint
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
