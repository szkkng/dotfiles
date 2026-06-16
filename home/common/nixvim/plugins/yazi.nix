{ ... }:
{
  plugins.yazi = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>yo";
      action = "<cmd>Yazi<CR>";
    }
    {
      mode = "n";
      key = "<leader>yt";
      action = "<cmd>Yazi toggle<CR>";
    }
  ];
}
