{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.default ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    nixpkgs.config.allowUnfree = true;

    globals.mapleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        integrations = {
          indent_blankline = {
            enabled = true;
            scope_color = "lavender";
            colored_indent_levels = false;
          };
        };
      };
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
      ./plugin/conform.nix
      ./plugin/treesitter.nix
      ./plugin/web-devicons.nix
      ./plugin/telescope.nix
      ./plugin/lsp.nix
      ./plugin/gitsigns.nix
      ./plugin/indent-blankline.nix
      ./plugin/copilot.nix
      # ./plugin/cmp.nix
      ./plugin/dap.nix
      ./plugin/ts-comments.nix
      ./plugin/yazi.nix
      ./plugin/blink-cmp.nix
    ];
  };
}
