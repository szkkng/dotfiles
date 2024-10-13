return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting

    null_ls.setup {
      debug = false,
      sources = {
        formatting.stylua,
        formatting.prettier,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.nixfmt,
      },
    }
  end,
}

