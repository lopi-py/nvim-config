local icons = require "config.icons"
local util = require "util"

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
    "luukvbaal/statuscol.nvim",
    event = { "LazyFile" },
    branch = "0.10",
    opts = function()
      local builtin = require "statuscol.builtin"

      return {
        relculright = true,
        segments = {
          {
            text = { builtin.foldfunc, " " },
            click = "v:lua.ScFa",
          },
          {
            text = { builtin.lnumfunc, " " },
            click = "v:lua.ScLa",
          },
          {
            sign = { namespace = { "gitsigns" } },
            click = "v:lua.ScSa",
            condition = {
              function(args)
                return util.is_file(args.buf)
              end,
            },
          },
        },
      }
    end,
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
    "Bekaboo/dropbar.nvim",
    event = { "LazyFile" },
    opts = {
      general = {
        enable = function(bufnr, winnr)
          if not util.is_file(bufnr) then
            return false
          end
          if not vim.uri_from_bufnr(bufnr):find "^file" then
            return false
          end
          return not vim.wo[winnr].diff
        end,
        attach_events = { "BufWinEnter", "BufWritePost" },
      },
      icons = {
        kinds = { symbols = icons.kind },
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "LazyFile" },
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = { "LazyFile" },
    opts = function()
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
          added = " " .. icons.diff.added .. " ",
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
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
