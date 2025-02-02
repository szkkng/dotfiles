return {
  "rmagatti/auto-session",
  keys = {
    { "<leader>sr", "<cmd>SessionRestore<CR>" },
    { "<leader>ss", "<cmd>SessionSave<CR>" },
  },
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_save = false,
    auto_restore = false,
  },
}
