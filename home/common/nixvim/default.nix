{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.default ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
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
      signs = {
        text = {
          "__rawKey__vim.diagnostic.severity.ERROR" = "";
          "__rawKey__vim.diagnostic.severity.WARN" = "";
          "__rawKey__vim.diagnostic.severity.HINT" = "󰌶";
          "__rawKey__vim.diagnostic.severity.INFO" = "";
        };
      };
      virtual_text = false;
      update_in_insert = false;
      severity_sort = true;
      float = {
        border = "rounded";
        header = "";
        prefix = "";
      };
    };

    imports = [
      ./core/option.nix
      ./core/keymap.nix
      ./core/autocmd.nix
      ./core/filetype.nix
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
      ./plugin/lint.nix
    ];

    extraPackages = with pkgs; [
      actionlint
      gersemi
      prettierd
    ];
  };
}
