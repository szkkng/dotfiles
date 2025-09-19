{ ... }:
{
  plugins.auto-session = {
    enable = true;
    settings = {
      auto_save = false;
      auto_restore = false;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>SessionRestore<CR>";
    }
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>SessionSave<CR>";
    }
  ];
}
