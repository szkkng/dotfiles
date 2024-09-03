return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<CR>" },
    { "<leader>dB", "<cmd>lua require('dap').clear_breakpoints()<CR>" },
    { "<leader>dr", "<cmd>DapContinue<CR>" },
    { "<leader>dq", "<cmd>DapTerminate<CR>" },
    { "<leader>d1", "<cmd>DapStepOver<CR>" },
    { "<leader>d2", "<cmd>DapStepInto<CR>" },
    { "<leader>d3", "<cmd>DapStepOut<CR>" },
  },
  config = function() end,
}
