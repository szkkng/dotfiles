{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.default ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    extraPackages = with pkgs; [
      actionlint
      gersemi
      prettierd
    ];
    defaultEditor = true;
    viAlias = true;
    nixpkgs.config.allowUnfree = true;

    imports = [
      ./core
      ./plugin
    ];

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
  };
}
