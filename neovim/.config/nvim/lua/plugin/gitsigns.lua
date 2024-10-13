return {
  "lewis6991/gitsigns.nvim",
  event = { "BufRead", "BufNewFile" },
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
      vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, opts)
      vim.keymap.set("v", "<leader>gr", function()
        gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end)
      vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk_inline, opts)
      vim.keymap.set("n", "<leader>gb", function()
        gitsigns.blame_line { full = true }
      end, opts)
      vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, opts)
      vim.keymap.set("n", "<leader>g-", gitsigns.toggle_deleted, opts)
    end,
  },
}

