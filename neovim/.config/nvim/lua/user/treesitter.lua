local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "cpp", "javascript", "typescript", "tsx", "lua", "markdown", "markdown_inline", "bash" },
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M
