{ nixvim, ... }:
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    globals = {
      # disable netrw for nvim-tree (strongly advised)
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;

      mapleader = " ";
    };

    diagnostics = {
      virtual_text = false;
      severity_sort = true;
    };

    imports = [
      ./core/option.nix
      ./core/keymap.nix
      ./core/autocmd.nix
      ./plugin/autopairs.nix
      ./plugin/lualine.nix
      ./plugin/treesitter.nix
      ./plugin/web-devicons.nix
      ./plugin/nvim-tree.nix
      ./plugin/telescope.nix
      ./plugin/lsp.nix
      ./plugin/gitsigns.nix
      ./plugin/lspsaga.nix
      ./plugin/hlchunk.nix
      ./plugin/copilot.nix
      ./plugin/cmp.nix
      ./plugin/dap.nix
      ./plugin/ts-context-commentstring.nix
    ];
  };
}

