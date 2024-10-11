{ ... }:
{
  plugins.gitsigns = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "]c";
      action = "<cmd>lua require('gitsigns').nav_hunk('next')<CR>";
    }
    {
      mode = "n";
      key = "[c";
      action = "<cmd>lua require('gitsigns').nav_hunk('prev')<CR>";
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>lua require('gitsigns').reset_hunk()<CR>";
    }
    {
      mode = "v";
      key = "<leader>gr";
      action = "<cmd>lua require('gitsigns').reset_hunk({ vim.fn.line '.', vim.fn.line 'v' })<CR>";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>lua require('gitsigns').preview_hunk_inline()<CR>";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>lua require('gitsigns').blame_line({ full = true })<CR>";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>lua require('gitsigns').diffthis()<CR>";
    }
    {
      mode = "n";
      key = "<leader>g-";
      action = "<cmd>lua require('gitsigns').toggle_deleted()<CR>";
    }
  ];
}

