return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {
    integrations = {
      blink_cmp = true,
      indent_blankline = {
        scope_color = "lavender",
      },
      mason = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
