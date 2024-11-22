{ ... }:
{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
      };
    };
    settings = {
      defaults = {
        path_display = [ "truncate" ];
        vimgrep_arguments = [
          "rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
          "--glob=!.git/"
        ];
      };
      pickers = {
        live_grep = {
          theme = "dropdown";
        };
        grep_string = {
          theme = "dropdown";
        };
        find_files = {
          theme = "dropdown";
          previewer = false;
        };
        buffers = {
          theme = "dropdown";
          previewer = false;
          mappings = {
            i = {
              "<C-d>" = {
                __raw = ''
                  require ("telescope.actions").delete_buffer;
                '';
              };
            };
            n = {
              "dd" = {
                __raw = ''
                  require("telescope.actions").delete_buffer;
                '';
              };
            };
          };
        };
        planets = {
          show_pluto = true;
          show_moon = true;
        };
        colorscheme = {
          enable_preview = true;
        };
        lsp_references = {
          theme = "dropdown";
          initial_mode = "normal";
        };
        lsp_definitions = {
          theme = "dropdown";
          initial_mode = "normal";
        };
        lsp_declarations = {
          theme = "dropdown";
          initial_mode = "normal";
        };
        lsp_implementations = {
          theme = "dropdown";
          initial_mode = "normal";
        };
      };
    };
    keymaps = {
      "<leader>b" = "buffers";
      "<leader>ff" = "find_files";
      "<leader>ft" = "live_grep";
      "<leader>fh" = "help_tags";
      # "<leader>dl" = "<cmd>Telescope dap list_breakpoints<CR>";
      # "<leader>dv" = "<cmd>Telescope dap variables<CR>";
      # "<leader>df" = "<cmd>Telescope dap frames<CR>";
      # "<leader>dh" = "<cmd>Telescope dap commands<CR>";
    };
  };
}

