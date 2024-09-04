return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    implement = {
      enable = false,
    },
    lightbulb = {
      enable = false,
    },
    outline = {
      layout = "float",
    },
    ui = {
      title = false,
    },
  },
  config = function(_, opts)
    require("lspsaga").setup(opts)

    vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>")
    vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>")
    vim.keymap.set("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>")
    vim.keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>")
    vim.keymap.set("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
    vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>")
    vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>")
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>")
    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
    vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_type_definition<CR>")
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
    vim.keymap.set("n", "[d", function()
      require("lspsaga.diagnostic"):goto_prev()
    end)
    vim.keymap.set("n", "]d", function()
      require("lspsaga.diagnostic"):goto_next()
    end)
    vim.keymap.set("n", "[e", function()
      require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
    end)
    vim.keymap.set("n", "]e", function()
      require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
    end)
  end,
}
