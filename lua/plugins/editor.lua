local config = require "config"
local icons = require "config.icons"
local util = require "util"

return {
  {
    "RRethy/vim-illuminate",
    event = { "LazyFile" },
    opts = {
      should_enable = util.is_file,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "darazaki/indent-o-matic",
    event = { "LazyFile" },
    opts = {
      max_lines = 100,
      standar_widths = { 2, 4 },
    },
  },
}
