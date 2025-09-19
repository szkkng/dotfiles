{ ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      nixd.enable = true;
      lua_ls.enable = true;
      cssls.enable = true;
      html.enable = true;
      eslint.enable = true;
      ts_ls.enable = true;
      bashls.enable = true;
      jsonls.enable = true;
      neocmake.enable = true;
      just.enable = true;
    };
    onAttach = # lua
      ''
        local keymap = function(mode, keys, func)
          vim.keymap.set(mode, keys, func, { buffer = bufnr, silent = true })
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

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          keymap("n", "<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
          end)
        end

        if client and client.name == "clangd" then
          keymap("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>")
        end

        if client and client.name == "copilot" then
          vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
          vim.keymap.set("i", "<tab>", function()
            if not vim.lsp.inline_completion.get() then
              return "<tab>"
            end
          end, { expr = true })
        end
      '';

  };
}
