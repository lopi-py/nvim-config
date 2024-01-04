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

  {
    "s1n7ax/nvim-window-picker",
    opts = {
      hint = "floating-big-letter",
      filter_func = function(winnrs)
        return vim.tbl_filter(function(winnr)
          local bufnr = vim.api.nvim_win_get_buf(winnr)
          return util.is_file(bufnr)
        end, winnrs)
      end,
    },
  },
}
