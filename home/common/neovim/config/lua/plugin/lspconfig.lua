return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
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
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          keymap("n", "<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end)
        end
      end,
    })

    local servers = {
      clangd = {
        on_attach = function()
          vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>")
        end,
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              special = {
                spec = "require",
              },
            },
          },
        },
      },
      cssls = {},
      html = {},
      ts_ls = {},
      eslint = {},
      bashls = {},
      jsonls = {},
      yamlls = {},
      neocmake = {},
      nixd = {},
      hls = {},
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
      float = {
        border = "rounded",
        header = "",
        prefix = "",
      },
    }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    vim.diagnostic.config(default_diagnostic_config)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

    for server_name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      require("lspconfig")[server_name].setup(server)
    end
  end,
}
