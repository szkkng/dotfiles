vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#54546D" })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 250 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Add new line to the end of the file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  callback = function()
    local num_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(num_lines)
    if last_nonblank <= num_lines then
      vim.api.nvim_buf_set_lines(0, last_nonblank, num_lines, true, { "" })
    end
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "Force commentstring to include spaces",
  callback = function(event)
    local cs = vim.bo[event.buf].commentstring
    vim.bo[event.buf].commentstring = cs:gsub("(%S)%%s", "%1 %%s"):gsub("%%s(%S)", "%%s %1")
  end,
})

