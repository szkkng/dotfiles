require ('telescope').setup{
  pickers = {
    find_files = {
      theme = "ivy",
    }
  }
}

vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
