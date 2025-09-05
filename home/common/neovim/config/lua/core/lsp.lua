vim.lsp.enable({
  "lua_ls",
  "clangd",
  "cssls",
  "html",
  "just",
  "ts_ls",
  "eslint",
  "bashls",
  "jsonls",
  "yamlls",
  "neocmake",
  "nixd",
  "hls",
  "copilot",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local keymap = function(mode, keys, func)
      vim.keymap.set(mode, keys, func, { buffer = event.buf, silent = true })
    end

    keymap("n", "gd", function()
      require("fzf-lua").lsp_definitions()
    end)
    keymap("n", "gD", vim.lsp.buf.declaration)
    keymap("n", "gt", function()
      require("fzf-lua").lsp_typedefs()
    end)
    keymap("n", "gr", function()
      require("fzf-lua").lsp_references()
    end)
    keymap("n", "gI", function()
      require("fzf-lua").lsp_implementations()
    end)
    keymap("n", "gS", function()
      require("fzf-lua").lsp_document_symbols()
    end)
    keymap("n", "<leader>la", function()
      require("fzf-lua").lsp_code_actions()
    end)
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

    if client and client.name == "copilot" then
      vim.lsp.inline_completion.enable(true, { bufnr = event.buf })
      vim.keymap.set("i", "<tab>", function()
        if not vim.lsp.inline_completion.get() then
          return "<tab>"
        end
      end, { expr = true })
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
