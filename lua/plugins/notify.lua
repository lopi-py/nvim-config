local icons = require "config.icons"

return {
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>d",
        function()
          require("notify").dismiss { silent = true, pending = true }
        end,
        desc = "Dismiss all notifications",
      },
    },
    opts = {
      background_colour = "#000000",
      stages = "slide",
      icons = {
        ERROR = icons.diagnostics.error,
        WARN = icons.diagnostics.warn,
        INFO = icons.diagnostics.info,
        TRACE = icons.trace,
        DEBUG = icons.debug,
      },
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(...)
        return require("notify").notify(...)
      end
    end,
  },
}
