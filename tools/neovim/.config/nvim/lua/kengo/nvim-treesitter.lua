require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua" },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "lua" }
  },
  indent = {
    enable = true
  }
}
