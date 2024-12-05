return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local keymap = function(mode, keys, func)
          vim.keymap.set(mode, keys, func, { buffer = event.buf })
        end

        keymap("n", "gd", require("telescope.builtin").lsp_definitions)
        keymap("n", "gD", vim.lsp.buf.declaration)
        keymap("n", "gt", require("telescope.builtin").lsp_type_definitions)
        keymap("n", "gr", require("telescope.builtin").lsp_references)
        keymap("n", "gI", require("telescope.builtin").lsp_implementations)
        keymap("n", "gS", require("telescope.builtin").lsp_document_symbols)
        keymap("n", "<leader>la", vim.lsp.buf.code_action)

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          keymap("n", "<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end)
        end
      end,
    })

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
      "neocmake",
      "nil_ls",
    }

    local default_diagnostic_config = {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "󰌶",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
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
