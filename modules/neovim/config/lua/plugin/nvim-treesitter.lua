return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "cpp",
      "cmake",
      "haskell",
      "javascript",
      "lua",
      "markdown",
      "markdown_inline",
      "yaml",
      "typescript",
      "tsx",
      "nix",
    },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
