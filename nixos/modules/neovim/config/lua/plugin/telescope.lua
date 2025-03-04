return {
  {
    "nvim-telescope/telescope-dap.nvim",
    lazy = true,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
      { "<leader>b", "<cmd>Telescope buffers<CR>" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
      { "<leader>ft", "<cmd>Telescope live_grep<CR>" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
      { "<leader>dl", "<cmd>Telescope dap list_breakpoints<CR>" },
      { "<leader>dv", "<cmd>Telescope dap variables<CR>" },
      { "<leader>df", "<cmd>Telescope dap frames<CR>" },
      { "<leader>dh", "<cmd>Telescope dap commands<CR>" },
    },
    opts = function()
      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
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
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  },
}
