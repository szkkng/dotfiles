vim.lsp.enable({
  "lua_ls",
  "clangd",
  "cssls",
  "html",
  "ts_ls",
  "eslint",
  "bashls",
  "jsonls",
  "yamlls",
  "neocmake",
  "nixd",
  "hls",
})

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
    keymap("n", "<leader>lo", vim.diagnostic.open_float)

    local diagnostic_goto = function(next, severity)
      vim.diagnostic.jump({ count = next and 1 or -1, severity = severity or nil, float = true })
    end
    keymap("n", "]d", function()
      diagnostic_goto(true)
    end)
    keymap("n", "[d", function()
      diagnostic_goto(false)
    end)
    keymap("n", "]w", function()
      diagnostic_goto(true, "WARN")
    end)
    keymap("n", "[w", function()
      diagnostic_goto(false, "WARN")
    end)
    keymap("n", "]e", function()
      diagnostic_goto(true, "ERROR")
    end)
    keymap("n", "[e", function()
      diagnostic_goto(false, "ERROR")
    end)

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      keymap("n", "<leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end)
    end

    if client and client.name == "clangd" then
      keymap("n", "gs", "<cmd>LspClangdSwitchSourceHeader<CR>")
    end
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "󰌶",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})
