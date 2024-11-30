return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    renderer = {
      icons = {
        glyphs = {
          git = {
            unstaged = "󰄱",
            staged = "󰱒",
            unmerged = "",
            renamed = "",
            untracked = "󰢤",
            deleted = "",
            ignored = "",
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
    },
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>" },
  },
}
