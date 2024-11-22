{ ... }:
{
  plugins.nvim-tree = {
    enable = true;
    updateFocusedFile = {
      enable = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<CR>";
      options.silent = true;
    }
  ];
}

