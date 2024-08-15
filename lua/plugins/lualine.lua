local config = require "config"

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    require("lualine_require").require = require

    local Block = {
      function()
        return " "
      end,
      padding = { left = 0, right = 0 },
    }

    local Branch = {
      "b:gitsigns_head",
      color = { gui = "bold" },
      padding = { left = 1, right = 1 },
    }

    local Diff = {
      "diff",
      symbols = {
        added = config.icons.git.added .. " ",
        modified = config.icons.git.modified .. " ",
        removed = config.icons.git.removed .. " ",
      },
      source = function()
        local status = vim.b.gitsigns_status_dict or {}
        return {
          added = status.added,
          modified = status.changed,
          removed = status.removed,
        }
      end,
    }

    local Diagnostics = {
      "diagnostics",
      symbols = config.icons.diagnostics,
    }

    return {
      options = {
        globalstatus = true,
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { Block },
        lualine_b = { Branch },
        lualine_c = { "filename", Diff },
        lualine_x = { Diagnostics, "encoding", "filetype" },
        lualine_y = { "location", "progress" },
        lualine_z = { Block },
      },
      extensions = { "lazy", "mason", "oil" },
    }
  end,
  init = function()
    vim.o.statusline = " "
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
