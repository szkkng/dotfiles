return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
      cmake = { "gersemi" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      markdown = { "prettierd" },
      nix = { "nixfmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}

