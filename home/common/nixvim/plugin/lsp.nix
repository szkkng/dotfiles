{ ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd = {
        enable = true;
        # cmd = [
        #   "clangd"
        #   "--offset-encoding=utf-16"
        #   "--completion-style=detailed"
        # ];
        onAttach.function = ''
          vim.keymap.set("n", "<leader>ls", "<cmd>ClangdSwitchSourceHeader<CR>", {
            buffer = bufnr})
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
    };
  };
}
