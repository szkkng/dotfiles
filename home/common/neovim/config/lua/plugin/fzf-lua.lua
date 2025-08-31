return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    files = {
      prompt = " ",
      cwd_prompt = false,
      winopts = {
        height = 0.4,
        width = 0.4,
        row = 0.5,
        col = 0.5,
        title = "",
        title_flags = false,
        preview = { hidden = true },
      },
    },
    buffers = {
      prompt = " ",
      winopts = {
        height = 0.4,
        width = 0.4,
        row = 0.5,
        col = 0.5,
        title = "",
        title_flags = false,
        preview = { hidden = true },
      },
    },
    dap = {
      commands = {
        prompt = " ",
        winopts = {
          row = 0.5,
          col = 0.5,
          title = "",
          title_flags = false,
        },
      },
      configurations = {
        prompt = " ",
        winopts = {
          row = 0.5,
          col = 0.5,
          title = "",
          title_flags = false,
        },
      },
      variables = {
        prompt = " ",
        winopts = {
          row = 0.5,
          col = 0.5,
          title = "",
          title_flags = false,
        },
      },
      frames = {
        prompt = " ",
        winopts = {
          row = 0.5,
          col = 0.5,
          title = "",
          title_flags = false,
        },
      },
      breakpoints = {
        prompt = " ",
        winopts = {
          row = 0.5,
          col = 0.5,
          title = "",
          title_flags = false,
        },
      },
    },
    grep = {
      prompt = " ",
      winopts = {
        row = 0.5,
        col = 0.5,
        title = "",
        title_flags = false,
      },
    },
    grep_curbuf = {
      prompt = " ",
      winopts = {
        row = 0.5,
        col = 0.5,
        title = "",
        title_flags = false,
      },
    },
    helptags = {
      prompt = " ",
      winopts = {
        row = 0.5,
        col = 0.5,
        title = "",
        title_flags = false,
      },
    },
    lsp = {
      code_actions = {
        prompt = " ",
        winopts = {
          preview = {
            vertical = "down:50%",
            layout = "vertical",
            scrollbar = false,
          },
          row = 0.5,
          col = 0.5,
          title = "",
          title_flags = false,
        },
      },
    },
  },
  keys = {
    {
      "<leader>fr",
      function()
        require("fzf-lua").resume()
      end,
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers()
      end,
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep()
      end,
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").help_tags()
      end,
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").lgrep_curbuf()
      end,
    },
  },
}
