local icons = require "config.icons"
local util = require "util"

return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        default_icon = icons.file,
      },
      strict = true,
      default = true,
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    opts = {},
  },

  {
    "famiu/bufdelete.nvim",
    keys = {
      { "<leader>bd", ":Bdelete<cr>", desc = "delete buffer" },
      { "<leader>bw", ":Bwipeout<cr>", desc = "wipeout buffer" },
    },
    cmd = { "Bdelete", "Bwipeout" },
  },
}
