{ ... }:
{
  plugins.lsp = {
    enable = true;
    onAttach = # lua
      ''
        local keymap = function(mode, keys, func)
          vim.keymap.set(mode, keys, func, { buffer = bufnr })
        end

        keymap("n", "gd", require("telescope.builtin").lsp_definitions)
        keymap("n", "gD", vim.lsp.buf.declaration)
        keymap("n", "gt", require("telescope.builtin").lsp_type_definitions)
        keymap("n", "gr", require("telescope.builtin").lsp_references)
        keymap("n", "gI", require("telescope.builtin").lsp_implementations)
        keymap("n", "gS", require("telescope.builtin").lsp_document_symbols)
        keymap("n", "<leader>la", vim.lsp.buf.code_action)

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          keymap("n", "<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
          end)
        end
      '';

    servers = {
      clangd = {
        enable = true;
        cmd = [
          "clangd"
          "--offset-encoding=utf-16"
          "--completion-style=detailed"
        ];
        onAttach.function = ''
          vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>")
        '';
      };
      nil_ls = {
        enable = true;
      };
      lua_ls = {
        enable = true;
      };
      cssls = {
        enable = true;
      };
      html = {
        enable = true;
      };
      eslint = {
        enable = true;
      };
      ts_ls = {
        enable = true;
      };
      bashls = {
        enable = true;
      };
      jsonls = {
        enable = true;
      };
      neocmake = {
        enable = true;
      };
    };
  };
}
