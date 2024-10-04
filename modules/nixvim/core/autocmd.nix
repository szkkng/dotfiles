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
    {
      event = [ "BufWritePre" ];
      callback = {
        __raw = ''
          function()
            vim.lsp.buf.format { async = false }
          end
        '';
      };
    }
    {
      event = [ "BufWritePre" ];
      pattern = [ "*" ];
      callback = {
        __raw = ''
          function()
            local num_lines = vim.api.nvim_buf_line_count(0)
            local last_nonblank = vim.fn.prevnonblank(num_lines)
            if last_nonblank <= num_lines then
              vim.api.nvim_buf_set_lines(0, last_nonblank, num_lines, true, { "" })
            end
          end
        '';
      };
    }
    {
      event = [ "FileType" ];
      callback = {
        __raw = ''
          function(event)
            local cs = vim.bo[event.buf].commentstring
            vim.bo[event.buf].commentstring = cs:gsub("(%S)%%s", "%1 %%s"):gsub("%%s(%S)", "%%s %1")
          end
        '';
      };
    }
  ];
}

