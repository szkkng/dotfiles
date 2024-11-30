return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
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
        "nil_ls",
      }

      return {
        ensure_installed = servers,
      }
    end,
  },
}
