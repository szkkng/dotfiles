{ config, nixvim, ... }:
{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;

    globals = {
      # disable netrw for nvim-tree (strongly advised)
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    imports = [
      ./core/options.nix
      ./plugin/lualine.nix
    ];
  };
}

