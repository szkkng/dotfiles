{ ... }:
{
  keymaps = [
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>noh<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>,";
      action = "<cmd>w<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-S>";
      action = ":%s/";
      options.silent = true;
    }
    {
      mode = "n";
      key = "-";
      action = "<C-x>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "+";
      action = "<C-a>";
      options.silent = true;
    }
    # better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.silent = true;
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.silent = true;
    }
    # buffers
    {
      mode = "n";
      key = "gp";
      action = "<cmd>bprevious<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "gn";
      action = "<cmd>bnext<CR>";
      options.silent = true;
    }
    # window
    {
      mode = "n";
      key = "<leader>wv";
      action = "<cmd>vs<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>ws";
      action = "<cmd>sp<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wl";
      action = "<C-w>l";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wh";
      action = "<C-w>h";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wk";
      action = "<C-w>k";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wj";
      action = "<C-w>j";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wH";
      action = "<C-w>H";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wL";
      action = "<C-w>L";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wq";
      action = "<cmd>confirm q<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<M-C-Up>";
      action = "<cmd>resize +2<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<M-C-Down>";
      action = "<cmd>resize -2<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<M-C-Left>";
      action = "<cmd>vertical resize -2<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<M-C-Right>";
      action = "<cmd>vertical resize +2<CR>";
      options.silent = true;
    }
  ];

  extraConfigLua = # lua
    ''
      -- diagnostics
      local diagnostic_goto = function(next, severity)
        vim.diagnostic.jump({ count = next and 1 or -1, severity = severity or nil, float = true })
      end
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
      vim.keymap.set("n", "]d", function()
        diagnostic_goto(true)
      end)
      vim.keymap.set("n", "[d", function()
        diagnostic_goto(false)
      end)
      vim.keymap.set("n", "]w", function()
        diagnostic_goto(true, "WARN")
      end)
      vim.keymap.set("n", "[w", function()
        diagnostic_goto(false, "WARN")
      end)
      vim.keymap.set("n", "]e", function()
        diagnostic_goto(true, "ERROR")
      end)
      vim.keymap.set("n", "[e", function()
        diagnostic_goto(false, "ERROR")
      end)
    '';
}
