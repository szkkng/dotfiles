{ ... }:
{
  plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        http = {
          copilot.__raw = # lua
            ''
              function()
                return require("codecompanion.adapters").extend("copilot", {
                  schema = {
                    model = {
                      default = "gpt-5-mini",
                      choices = {
                        "gpt-5",
                        "gpt-5-mini",
                      },
                    },
                  },
                })
              end,
            '';
        };
      };
      display = {
        chat = {
          window = {
            width = 0.33;
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ai";
      action = "<cmd>CodeCompanion<cr>";
    }
    {
      mode = [ "v" ];
      key = "<leader>aa";
      action = "<cmd>CodeCompanionChat Add<cr>";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>at";
      action = "<cmd>CodeCompanionChat Toggle<cr>";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>al";
      action = "<cmd>CodeCompanionActions<cr>";
    }
  ];

}
