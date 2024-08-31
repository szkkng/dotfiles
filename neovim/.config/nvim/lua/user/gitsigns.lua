return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require "gitsigns"
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "]c", function()
        gitsigns.nav_hunk "next"
      end, opts)
      vim.keymap.set("n", "[c", function()
        gitsigns.nav_hunk "prev"
      end, opts)
      vim.keymap.set("n", "<leader>gb", function()
        gitsigns.blame_line { full = true }
      end, opts)
      vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, opts)
      vim.keymap.set("n", "<leader>g-", gitsigns.toggle_deleted, opts)
    end,
  },
}
