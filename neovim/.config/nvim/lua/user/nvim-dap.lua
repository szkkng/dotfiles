return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>" },
    { "<leader>dr", "<cmd>DapContinue<cr>" },
    { "<leader>dt", "<cmd>DapTerminate<cr>" },
  },
  config = function() end,
}
