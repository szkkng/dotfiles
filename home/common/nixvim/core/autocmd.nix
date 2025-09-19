{ ... }:
{
  autoCmd = [
    {
      event = [ "TextYankPost" ];
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
    {
      event = [ "VimResized" ];
      callback.__raw = ''
        function()
          local current_tab = vim.fn.tabpagenr()
          vim.cmd("tabdo wincmd =")
          vim.cmd("tabnext " .. current_tab)
        end
      '';
    }
  ];
}
