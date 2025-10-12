vim.filetype.add({
  extension = {
    gen = "cpp",
    amxd = "json",
    maxpat = "json",
  },
  pattern = {
    [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
  },
})
