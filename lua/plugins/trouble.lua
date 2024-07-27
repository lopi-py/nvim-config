return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", ":Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  },
  cmd = "Trouble",
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
