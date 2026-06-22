{ ... }:
{
  plugins.zen-mode = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>zm";
      action = "<cmd>ZenMode<CR>";
    }
  ];
}
