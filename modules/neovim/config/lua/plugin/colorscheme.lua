return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {
    integrations = {
      indent_blankline = {
        scope_color = "lavender",
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
