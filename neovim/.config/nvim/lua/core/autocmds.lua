local function augroup(name)
  return vim.api.nvim_create_augroup("szkkng_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Format on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("format_on_save"),
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = augroup("try_lint"),
  callback = function()
    require("lint").try_lint()
  end,
})

-- Insert final newline
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("insert_final_newline"),
  pattern = "*",
  callback = function()
    local num_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(num_lines)
    if last_nonblank <= num_lines then
      vim.api.nvim_buf_set_lines(0, last_nonblank, num_lines, true, { "" })
    end
  end,
})

