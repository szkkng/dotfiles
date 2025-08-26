return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  depedencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>sn"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>sp"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]i"] = "@conditional.outer",
          ["]l"] = "@loop.outer",
        },
        goto_next_end = {
          ["]f"] = "@function.outer",
          ["]i"] = "@conditional.outer",
          ["]l"] = "@loop.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[i"] = "@conditional.outer",
          ["[l"] = "@loop.outer",
        },
        goto_previous_end = {
          ["[f"] = "@function.outer",
          ["[i"] = "@conditional.outer",
          ["[l"] = "@loop.outer",
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
