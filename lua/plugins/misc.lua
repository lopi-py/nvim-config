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
}
