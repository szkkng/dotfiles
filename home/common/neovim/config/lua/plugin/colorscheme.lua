return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent_background = true,
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
