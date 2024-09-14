return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    update_focused_file = {
      enable = true,
    },
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>" },
  },
}

