{ ... }:
{
  plugins.lspsaga = {
    enable = true;
    lightbulb = {
      enable = false;
    };
    outline = {
      layout = "float";
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>la";
      action = "<cmd>Lspsaga code_action<CR>";
    }
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd>Lspsaga peek_definition<CR>";
    }
    {
      mode = "n";
      key = "<leader>lt";
      action = "<cmd>Lspsaga peek_type_definition<CR>";
    }
    {
      mode = "n";
      key = "<leader>ll";
      action = "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>";
    }
    {
      mode = "n";
      key = "<leader>lb";
      action = "<cmd>Lspsaga show_buf_diagnostics<CR>";
    }
    {
      mode = "n";
      key = "<leader>lo";
      action = "<cmd>Lspsaga outline<CR>";
    }
    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd>Lspsaga rename<CR>";
    }
    {
      mode = "n";
      key = "<leader>li";
      action = "<cmd>LspInfo<CR>";
    }
    {
      mode = "n";
      key = "gd";
      action = "<cmd>Lspsaga goto_definition<CR>";
    }
    {
      mode = "n";
      key = "gD";
      action = "<cmd>Lspsaga goto_type_definition<CR>";
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>Lspsaga hover_doc<CR>";
    }
    {
      mode = "n";
      key = "[d";
      action = "<cmd>lua require('lspsaga.diagnostic'):goto_prev()<CR>";
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>lua require('lspsaga.diagnostic'):goto_next()<CR>";
    }
    {
      mode = "n";
      key = "[e";
      action = "<cmd>lua require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>";
    }
    {
      mode = "n";
      key = "]e";
      action = "<cmd>lua require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.ERROR }<CR>";
    }
  ];
}

