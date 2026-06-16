{ ... }:
{
  plugins.dap = {
    enable = true;
    adapters = {
      executables = {
        lldb.command = "lldb-dap";
      };
    };
    configurations = {
      cpp = [
        {
          name = "Launch file";
          type = "lldb";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
        {
          name = "Ableton Live";
          type = "lldb";
          request = "launch";
          program = "/Applications/Ableton Live 12 Suite.app";
          stopOnEntry = false;
        }
      ];
    };
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
        linehl = "";
        numhl = "";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
        linehl = "";
        numhl = "";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
        linehl = "";
        numhl = "";
      };
    };
  };

  plugins.dap-ui.enable = true;
  plugins.dap-virtual-text.enable = true;

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
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = ''
        function()
          require("fzf-lua").dap_breakpoints()
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = ''
        function()
          require("fzf-lua").dap_configurations()
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>dv";
      action.__raw = ''
        function()
          require("fzf-lua").dap_variables()
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>df";
      action.__raw = ''
        function()
          require("fzf-lua").dap_frames()
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>dh";
      action.__raw = ''
        function()
          require("fzf-lua").dap_commands()
        end
      '';
    }
  ];
}
