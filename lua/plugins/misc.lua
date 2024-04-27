local icons = require "config.icons"

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
