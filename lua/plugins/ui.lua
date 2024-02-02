local icons = require "config.icons"

return {
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
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

  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        win_options = {
          winblend = 0,
        },
        border = icons.border,
      },
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.select(...)
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.input(...)
      end
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    opts = {
      progress = {
        suppress_on_insert = true,
      },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    event = { "LazyFile" },
    opts = {
      open_fold_hl_timeout = 0,
    },
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "LazyFile" },
    main = "ibl",
    opts = {
      debounce = 50,
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = {
        enabled = false,
        show_start = false,
      },
    },
  },
}
