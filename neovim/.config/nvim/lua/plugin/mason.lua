return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
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

    require("mason").setup {
      ui = {
        border = "rounded",
      },
    }

    require("mason-lspconfig").setup {
      ensure_installed = servers,
    }
  end,
}
