return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      lazy = true,
    },
    {
      "nvim-telescope/telescope-dap.nvim",
    },
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },
      grep_string = {
        theme = "dropdown",
      },
      find_files = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        mappings = {
          i = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
          },
          n = {
            ["dd"] = require("telescope.actions").delete_buffer,
          },
        },
      },
      planets = {
        show_pluto = true,
        show_moon = true,
      },
      colorscheme = {
        enable_preview = true,
      },
      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)

    local builtin = require "telescope.builtin"
    vim.keymap.set("n", "<leader>b", builtin.buffers)
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>ft", builtin.live_grep)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags)

    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope dap list_breakpoints<CR>")
    vim.keymap.set("n", "<leader>dv", "<cmd>Telescope dap variables<CR>")
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<CR>")
    vim.keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<CR>")

    require("telescope").load_extension "fzf"
    require("telescope").load_extension "dap"
  end,
}
