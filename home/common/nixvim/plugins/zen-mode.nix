{ ... }:
{
  plugins.zen-mode = {
    enable = true;
    settings = {
      window = {
        backdrop = 1;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>z";
      action = "<cmd>ZenMode<cr>";
    }
  ];
}
