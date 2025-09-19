{ ... }:
{
  plugins.fzf-lua = {
    enable = true;
    keymaps = {
      "<leader>fr" = "resume";
      "<leader>ff" = "files";
      "<leader>fb" = "buffers";
      "<leader>fg" = "live_grep";
      "<leader>fh" = "help_tags";
      "<leader>/" = "lgrep_curbuf";
    };
    settings = {
      files = {
        prompt = " ";
        cwd_prompt = false;
        winopts = {
          height = 0.4;
          width = 0.4;
          row = 0.5;
          col = 0.5;
          title = "";
          title_flags = false;
          preview = {
            hidden = true;
          };
        };
      };
      buffers = {
        prompt = " ";
        winopts = {
          height = 0.4;
          width = 0.4;
          row = 0.5;
          col = 0.5;
          title = "";
          title_flags = false;
          preview = {
            hidden = true;
          };
        };
      };
      dap = {
        commands = {
          prompt = " ";
          winopts = {
            row = 0.5;
            col = 0.5;
            title = "";
            title_flags = false;
          };
        };
        configurations = {
          prompt = " ";
          winopts = {
            row = 0.5;
            col = 0.5;
            title = "";
            title_flags = false;
          };
        };
        variables = {
          prompt = " ";
          winopts = {
            row = 0.5;
            col = 0.5;
            title = "";
            title_flags = false;
          };
        };
        frames = {
          prompt = " ";
          winopts = {
            row = 0.5;
            col = 0.5;
            title = "";
            title_flags = false;
          };
        };
        breakpoints = {
          prompt = " ";
          winopts = {
            row = 0.5;
            col = 0.5;
            title = "";
            title_flags = false;
          };
        };
      };
      grep = {
        prompt = " ";
        winopts = {
          row = 0.5;
          col = 0.5;
          title = "";
          title_flags = false;
        };
      };
      grep_curbuf = {
        prompt = " ";
        winopts = {
          row = 0.5;
          col = 0.5;
          title = "";
          title_flags = false;
        };
      };
      helptags = {
        prompt = " ";
        winopts = {
          row = 0.5;
          col = 0.5;
          title = "";
          title_flags = false;
        };
      };
      lsp = {
        code_actions = {
          prompt = " ";
          winopts = {
            preview = {
              vertical = "down:50%";
              layout = "vertical";
              scrollbar = false;
            };
            row = 0.5;
            col = 0.5;
            title = "";
            title_flags = false;
          };
        };
      };

    };
  };

}
