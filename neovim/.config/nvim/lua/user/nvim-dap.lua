local M = {
  "mfussenegger/nvim-dap",
}

function M.config()
  local dap = require "dap"
  dap.adapters.lldb = {
    type = "executable",
    command = "/opt/homebrew/Cellar/llvm/18.1.5/bin/lldb-dap",
    name = "lldb",
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
      args = {},
      runInTerminal = false,
    },
  }
end

return M
