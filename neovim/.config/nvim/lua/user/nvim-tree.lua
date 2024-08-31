return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  event = "VeryLazy",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>" },
  },
}
