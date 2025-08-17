return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
  },
  keys = {
    { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" } },
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Add<cr>",
      mode = { "v" },
    },
    {
      "<leader>at",
      "<cmd>CodeCompanionChat Toggle<cr>",
      mode = { "n", "v" },
    },
    {
      "<leader>al",
      "<cmd>CodeCompanionActions<cr>",
      mode = { "n", "v" },
    },
  },
  opts = {
    adapters = {
      copilot = function()
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
    },
    display = {
      chat = {
        window = {
          width = 0.3,
        },
      },
    },
  },
}
