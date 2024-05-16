-- vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#553311" })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 250 }
  end,
})
