{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
    withNodeJs = true;
    withRuby = false;
    withPython3 = false;
    extraPackages = with pkgs; [
      gcc
      cmake
      gnumake
      tree-sitter
      lua-language-server
      copilot-language-server
      stylua
    ];
  };

  xdg.configFile = {
    "nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/common/neovim/config";
      recursive = true;
    };
    "nvim/init.lua".enable = lib.mkForce false;
  };
}
