return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    require("lualine_require").require = require
    return {
      options = {
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = {
          {
            function()
              return " "
            end,
            padding = { left = 0, right = 0 },
          },
        },
        lualine_b = {
          {
            "b:gitsigns_head",
            color = { gui = "bold" },
          },
        },
        lualine_c = {
          { "filename", path = 1 },
          {
            "diff",
            source = function()
              local status = vim.b.gitsigns_status_dict or {}
              return {
                added = status.added,
                modified = status.changed,
                removed = status.removed,
              }
            end,
          },
        },
        lualine_x = { "diagnostics", "encoding", "filetype" },
      },
      extensions = { "lazy", "mason", "oil" },
    }
  end,
  init = function()
    vim.o.laststatus = 3
    vim.o.statusline = " "
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
