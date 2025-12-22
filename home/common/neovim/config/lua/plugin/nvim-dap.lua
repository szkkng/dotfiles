return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "igorlfs/nvim-dap-view",
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = {},
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
    {
      "<leader>dl",
      function()
        require("fzf-lua").dap_breakpoints()
      end,
    },
    {
      "<leader>dc",
      function()
        require("fzf-lua").dap_configurations()
      end,
    },
    {
      "<leader>dv",
      function()
        require("fzf-lua").dap_variables()
      end,
    },
    {
      "<leader>df",
      function()
        require("fzf-lua").dap_frames()
      end,
    },
    {
      "<leader>dh",
      function()
        require("fzf-lua").dap_commands()
      end,
    },
  },
  config = function()
    local dap = require("dap")
    dap.adapters.lldb = {
      type = "executable",
      command = "lldb-dap",
      name = "lldb",
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
      {
        name = "Ableton Live",
        type = "lldb",
        request = "launch",
        program = "/Applications/Ableton Live 12 Suite.app",
        stopOnEntry = false,
      },
    }

    local sign = vim.fn.sign_define
    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

    local dapview = require("dap-view")
    dap.listeners.before.attach.dapview_config = function()
      dapview.open()
    end
    dap.listeners.before.launch.dapview_config = function()
      dapview.open()
    end
    dap.listeners.before.event_terminated.dapview_config = function()
      dapview.close()
    end
    dap.listeners.before.event_exited.dapview_config = function()
      dapview.close()
    end
  end,
}
