{ ... }:
{
  plugins.inc-rename = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>lr";
      action.__raw = ''
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end
      '';
      options.expr = true;
    }
  ];
}
