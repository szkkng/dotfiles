return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = function()
      local servers = {
        "clangd",
        "lua_ls",
        "cssls",
        "html",
        "eslint",
        "ts_ls",
        "bashls",
        "jsonls",
        "neocmake",
      }

      return {
        ensure_installed = servers,
      }
    end,
  },
}

