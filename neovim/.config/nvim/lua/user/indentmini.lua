return {
  "nvimdev/indentmini.nvim",
  event = "BufEnter",
  config = function()
    require("indentmini").setup {}
    vim.cmd.highlight "IndentLine guifg=#363646" -- Kanagawa sumiInk3
    vim.cmd.highlight "IndentLineCurrent guifg=#957FB8" -- Kanagawa oniViolet
  end,
}
