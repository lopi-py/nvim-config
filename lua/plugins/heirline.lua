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
      condition = function()
        return vim.b.gitsigns_status and vim.b.gitsigns_status ~= ""
      end,
      provider = function()
        return vim.b.gitsigns_status
      end,
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
          return vim.fn.fnamemodify(filename, ":t")
        elseif vim.bo.buftype == "terminal" then
          return filename:gsub(".*%d:", "")
        elseif #filename == 0 then
          return "[No Name]"
        end
        return filename
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
        return vim.bo.filetype ~= ""
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
      update = { "DiagnosticChanged", "BufEnter" },
      provider = function()
        return vim.diagnostic.status()
      end,
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
        pad(GitDiff),
        { provider = "%=" },
        pad(Diagnostics),
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
