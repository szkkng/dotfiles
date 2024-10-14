return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
  config = function()
    local servers = {
      "clangd",
      "lua_ls",
      "cssls",
      "html",
      "eslint",
      "ts_ls",
      "eslint",
      "bashls",
      "jsonls",
      "yamlls",
    }

    local default_diagnostic_config = {
      virtual_text = false,
      update_in_insert = false,
      severity_sort = true,
    }

    vim.diagnostic.config(default_diagnostic_config)

    local function common_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      return capabilities
    end

    for _, server in pairs(servers) do
      local opts = {
        capabilities = common_capabilities(),
      }

      local require_ok, settings = pcall(require, "plugin.server." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("force", opts, settings)
      end

      if server == "lua_ls" then
        require("neodev").setup({})
      end

      require("lspconfig")[server].setup(opts)
    end
  end,
}

