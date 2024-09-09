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
        "tsserver",
        "bashls",
        "jsonls",
      }

      return {
        ensure_installed = servers,
      }
    end,
  },
}

