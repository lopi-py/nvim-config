local icons = require "config.icons"

return {
  {
    "nvim-lualine/lualine.nvim",
    event = { "VeryLazy" },
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
        icon = icons.git.branch,
        color = { gui = "bold" },
        padding = { left = 2, right = 1 },
        on_click = function()
          require("telescope.builtin").git_branches()
        end,
      }

      local Diff = {
        "diff",
        symbols = {
          added = icons.diff.added .. " ",
          modified = icons.diff.modified .. " ",
          removed = icons.diff.removed .. " ",
        },
        source = function()
          local status = vim.b.gitsigns_status_dict or {}
          return {
            added = status.added,
            modified = status.changed,
            removed = status.removed,
          }
        end,
        on_click = function()
          require("gitsigns.actions").diffthis "~"
        end,
      }

      local Filename = {
        "filename",
        symbols = {
          modified = icons.modified,
          readonly = icons.lock,
        },
      }

      local Diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = icons.diagnostics,
        on_click = function()
          require("trouble").open()
        end,
      }

      return {
        options = {
          globalstatus = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { Block },
          lualine_b = { Branch },
          lualine_c = { Filename, Diff },
          lualine_x = { Diagnostics, "encoding", "filetype" },
          lualine_y = { "location", "progress" },
          lualine_z = { Block },
        },
        extensions = { "lazy", "mason", "trouble", "oil" },
      }
    end,
    init = function()
      vim.o.statusline = " "
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
