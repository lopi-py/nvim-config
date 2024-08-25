return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    require("lualine_require").require = require

    local block = {
      function()
        return " "
      end,
      padding = { left = 0, right = 0 },
    }

    local branch = {
      "b:gitsigns_head",
      color = { gui = "bold" },
    }

    local filename = {
      "filename",
      path = 1,
    }

    local diff = {
      "diff",
      source = function()
        local status = vim.b.gitsigns_status_dict or {}
        return {
          added = status.added,
          modified = status.changed,
          removed = status.removed,
        }
      end,
    }

    return {
      options = {
        globalstatus = true,
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { block },
        lualine_b = { branch },
        lualine_c = { filename, diff },
        lualine_x = { "diagnostics", "encoding", "filetype" },
        lualine_y = { "location", "progress" },
        lualine_z = { block },
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
