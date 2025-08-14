return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {
        virt_text_pos = "eol",
      },
    },
  },
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<CR>" },
    { "<leader>dB", "<cmd>lua require('dap').clear_breakpoints()<CR>" },
    { "<leader>dr", "<cmd>DapContinue<CR>" },
    { "<leader>dq", "<cmd>DapTerminate<CR>" },
    { "<leader>d1", "<cmd>DapStepOver<CR>" },
    { "<leader>d2", "<cmd>DapStepInto<CR>" },
    { "<leader>d3", "<cmd>DapStepOut<CR>" },
  },
  config = function()
    local dap = require("dap")
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    local sign = vim.fn.sign_define
    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
