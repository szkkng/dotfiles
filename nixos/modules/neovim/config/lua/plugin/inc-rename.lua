return {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "<leader>lr",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
    },
  },
  opts = {},
}
