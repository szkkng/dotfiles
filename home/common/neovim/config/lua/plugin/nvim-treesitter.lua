return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local parsers = {
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
    }

    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
