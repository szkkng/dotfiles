return {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
    "--completion-style=detailed",
  },
  on_attach = function()
    vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>")
  end,
}
