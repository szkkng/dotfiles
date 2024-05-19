local M = {
  "JoosepAlviste/nvim-ts-context-commentstring",
  event = "VeryLazy",
}

function M.config()
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }

  vim.schedule(function()
    local get_option = vim.filetype.get_option
    vim.filetype.get_option = function(filetype, option)
      return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
        or get_option(filetype, option)
    end
  end)
end

return M
