return {
  on_attach = function()
    vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>")
  end,
}
