return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "v0.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer" },
      },
    },
    windows = {
      autocomplete = {
        scrollbar = false,
      },
    },
  },
  opts_extend = { "sources.completion.enabled_providers" },
}
