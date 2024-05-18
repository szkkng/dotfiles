local M = {
  "mfussenegger/nvim-dap",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint at line" },
    ["<leader>dr"] = { "<cmd>DapContinue<cr>", "Start or continue the debugger" },
    ["<leader>dt"] = { "<cmd>DapTerminate<cr>", "Terminate the debug session" },
  }
end

return M
