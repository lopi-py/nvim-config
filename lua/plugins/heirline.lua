return {
  "rebelot/heirline.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.statusline = " "
    vim.api.nvim_create_autocmd("DiagnosticChanged", {
      command = "redrawstatus",
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "GitSignsUpdate",
      command = "redrawstatus",
    })
  end,
  opts = function()
    local conditions = require "heirline.conditions"
    local utils = require "heirline.utils"

    local function pad(child)
      return {
        condition = child.condition,
        child,
        { provider = " " },
      }
    end

    local ViMode = {
      update = "ModeChanged",
      provider = " ",
      hl = function(self)
        return { bg = self:mode_color() }
      end,
    }

    local GitBranch = {
      condition = function()
        return vim.b.gitsigns_head and vim.b.gitsigns_head ~= ""
      end,
      provider = function()
        return vim.b.gitsigns_head
      end,
      hl = function(self)
        return { fg = self:mode_color(), bold = true }
      end,
    }

    local GitDiff = {
      condition = conditions.is_git_repo,
      init = function(self)
        local status = vim.b.gitsigns_status_dict
        self.added = status.added or 0
        self.changed = status.changed or 0
        self.removed = status.removed or 0
      end,
      {
        condition = function(self)
          return self.added > 0
        end,
        provider = function(self)
          return "+" .. self.added .. " "
        end,
        hl = { fg = "git_add" },
      },
      {
        condition = function(self)
          return self.changed > 0
        end,
        provider = function(self)
          return "~" .. self.changed .. " "
        end,
        hl = { fg = "git_change" },
      },
      {
        condition = function(self)
          return self.removed > 0
        end,
        provider = function(self)
          return "-" .. self.removed .. " "
        end,
        hl = { fg = "git_delete" },
      },
    }

    local FileName = {
      condition = function()
        return vim.bo.buftype ~= "prompt"
      end,
      provider = function()
        local filename
        if package.loaded.oil then
          filename = require("oil").get_current_dir()
        end
        if not filename then
          filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
        end
        if vim.bo.buftype == "help" then
          filename = vim.fn.fnamemodify(filename, ":t")
        elseif vim.bo.buftype == "terminal" then
          filename = filename:gsub(".*%d:", "")
        end
        return #filename > 0 and filename or "[No Name]"
      end,
    }

    local FileFlags = {
      condition = function()
        return vim.bo.buftype ~= "prompt"
      end,
      {
        condition = function()
          return vim.bo.filetype == "help"
        end,
        provider = " (help)",
      },
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = " [+]",
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " [-]",
      },
    }

    local FileEncoding = {
      condition = function()
        return vim.bo.fileencoding ~= ""
      end,
      provider = function()
        return vim.bo.fileencoding
      end,
    }

    local FileIcon = {
      init = function(self)
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color_by_filetype(
          vim.bo.filetype,
          { default = true }
        )
      end,
      provider = function(self)
        return self.icon .. " "
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end,
    }

    local FileType = {
      condition = function()
        return vim.bo.filetype ~= "" and vim.bo.buftype == ""
      end,
      FileIcon,
      {
        provider = function()
          return vim.bo.filetype
        end,
      },
    }

    local Diagnostics = {
      condition = conditions.has_diagnostics,
      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      end,
      update = { "DiagnosticChanged", "BufEnter" },
      {
        condition = function(self)
          return self.errors > 0
        end,
        provider = function(self)
          return "E" .. self.errors .. " "
        end,
        hl = { fg = "diag_error" },
      },
      {
        condition = function(self)
          return self.warnings > 0
        end,
        provider = function(self)
          return "W" .. self.warnings .. " "
        end,

        hl = { fg = "diag_warn" },
      },
      {
        condition = function(self)
          return self.info > 0
        end,
        provider = function(self)
          return "I" .. self.info .. " "
        end,
        hl = { fg = "diag_info" },
      },
      {
        condition = function(self)
          return self.hints > 0
        end,
        provider = function(self)
          return "H" .. self.hints .. " "
        end,
        hl = { fg = "diag_hint" },
      },
    }

    local Ruler = {
      update = "ModeChanged",
      provider = "%P %l:%c",
      hl = function(self)
        return { fg = self:mode_color(), bold = true }
      end,
    }

    return {
      colors = function()
        return {
          red = utils.get_highlight("DiagnosticError").fg,
          yellow = utils.get_highlight("DiagnosticWarn").fg,
          green = utils.get_highlight("DiagnosticOk").fg,
          ["function"] = utils.get_highlight("Function").fg,
          constant = utils.get_highlight("Constant").fg,
          statement = utils.get_highlight("Statement").fg,

          diag_error = utils.get_highlight("DiagnosticError").fg,
          diag_warn = utils.get_highlight("DiagnosticWarn").fg,
          diag_info = utils.get_highlight("DiagnosticInfo").fg,
          diag_hint = utils.get_highlight("DiagnosticHint").fg,

          git_add = utils.get_highlight("GitSignsAdd").fg,
          git_change = utils.get_highlight("GitSignsChange").fg,
          git_delete = utils.get_highlight("GitSignsDelete").fg,
        }
      end,
      statusline = {
        static = {
          mode_colors = {
            n = "function",
            i = "green",
            v = "statement",
            V = "statement",
            ["\22"] = "statement",
            c = "yellow",
            s = "statement",
            S = "statement",
            ["\19"] = "statement",
            R = "red",
            r = "red",
            ["!"] = "constant",
            t = "constant",
          },
          mode_color = function(self)
            return self.mode_colors[vim.fn.mode()]
          end,
        },
        pad(ViMode),
        pad(GitBranch),
        pad { FileName, FileFlags },
        GitDiff,
        { provider = "%=" },
        Diagnostics,
        pad(FileEncoding),
        pad(FileType),
        pad(Ruler),
        ViMode,
      },
    }
  end,
  config = function(_, opts)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        require("heirline.utils").on_colorscheme(opts.colors)
      end,
    })
    require("heirline").load_colors(opts.colors)
    require("heirline").setup(opts)
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
