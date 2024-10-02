{ ... }:
{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;

    globals = {
      # disable netrw for nvim-tree (strongly advised)
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
      mapleader = " ";
    };

    imports = [
      ./core/option.nix
      ./core/keymap.nix
      ./core/autocmd.nix
      ./plugin/lualine.nix
      ./plugin/treesitter.nix
    ];
  };
}

