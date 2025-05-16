{ ... }:
{
  plugins.dap.enable = true;
  plugins.dap-ui.enable = true;
  plugins.dap-virtual-text.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>DapToggleBreakpoint<CR>";
    }
    {
      mode = "n";
      key = "<leader>dB";
      action = "<cmd>lua require('dap').clear_breakpoints()<CR>";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = "<cmd>DapContinue<CR>";
    }
    {
      mode = "n";
      key = "<leader>dq";
      action = "<cmd>DapTerminate<CR>";
    }
    {
      mode = "n";
      key = "<leader>d1";
      action = "<cmd>DapStepOver<CR>";
    }
    {
      mode = "n";
      key = "<leader>d2";
      action = "<cmd>DapStepInto<CR>";
    }
    {
      mode = "n";
      key = "<leader>d3";
      action = "<cmd>DapStepOut<CR>";
    }
  ];
  extraConfigLua = ''
    local dap, dapui = require "dap", require "dapui"
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
  '';
}
