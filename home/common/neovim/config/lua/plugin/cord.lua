return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    editor = {
      tooltip = "Neovim",
    },
    text = {
      workspace = "",
      viewing = "Viewing",
      editing = "Editing",
      file_browser = "Browsing files",
      plugin_manager = "Managing plugins",
      lsp = "Configuring LSP",
      docs = "Reading",
      vcs = "Committing changes",
      notes = "Taking notes",
      debug = "Debugging",
      test = "Testing",
      diagnostics = "Fixing problems",
      games = "Playing",
      terminal = "Running commands",
      dashboard = "Home",
    },
  },
}
