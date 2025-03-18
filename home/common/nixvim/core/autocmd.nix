{ ... }:
{
  autoCmd = [
    {
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
    # {
    #   event = [ "FileType" ];
    #   callback = {
    #     __raw = ''
    #       function(event)
    #         local cs = vim.bo[event.buf].commentstring
    #         vim.bo[event.buf].commentstring = cs:gsub("(%S)%%s", "%1 %%s"):gsub("%%s(%S)", "%%s %1")
    #       end
    #     '';
    #   };
    # }
  ];
}
