local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require ('telescope').setup{
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  pickers = {
  },
  extensions = {
    file_browser = {
      hidden = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
          ["<C-h>"] = false,
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>ff', ":Telescope file_browser<CR>", { noremap = true })
vim.keymap.set('n', '<leader>fp', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true })
