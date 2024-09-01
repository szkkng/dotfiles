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
      "tsserver",
      "eslint",
      "tsserver",
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

    local function lsp_keymaps(bufnr)
      local opts = { noremap = true, buffer = bufnr, silent = true }
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end

    local function common_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      return capabilities
    end

    for _, server in pairs(servers) do
      local opts = {
        on_attach = function(_, bufnr)
          lsp_keymaps(bufnr)
        end,
        capabilities = common_capabilities(),
      }

      local require_ok, settings = pcall(require, "user.lspsettings." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("force", settings, opts)
      end

      if server == "lua_ls" then
        require("neodev").setup {}
      end

      require("lspconfig")[server].setup(opts)
    end
  end,
}
