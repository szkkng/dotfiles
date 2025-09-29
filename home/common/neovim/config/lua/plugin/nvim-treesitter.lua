return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "cpp",
      "cmake",
      "haskell",
      "javascript",
      "json",
      "just",
      "lua",
      "markdown",
      "markdown_inline",
      "yaml",
      "typescript",
      "tsx",
      "nix",
      "zig",
    },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
