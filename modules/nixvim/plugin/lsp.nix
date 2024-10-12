{ ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd = {
        enable = true;
        cmd = [
          "clangd"
          "--offset-encoding=utf-16"
          "--completion-style=detailed"
        ];
        onAttach.function = ''
          vim.keymap.set("n", "<leader>ls", "<cmd>ClangdSwitchSourceHeader<CR>", {
            buffer = bufnr})
        '';
      };
      nil-ls = {
        enable = true;
        settings.formatting.command = [ "nixfmt" ];
      };
      lua-ls = {
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
      ts-ls = {
        enable = true;
      };
      bashls = {
        enable = true;
      };
      jsonls = {
        enable = true;
      };
    };
  };
}

