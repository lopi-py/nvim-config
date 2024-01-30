local config = require "config"
local icons = require "config.icons"
local util = require "util"

return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "-", ":Oil<cr>", desc = "Open parent directory" },
      {
        "_",
        function()
          require("oil").open(vim.uv.cwd())
        end,
        desc = "Open currenty working directory",
      },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          return vim.startswith(name, "..") or vim.list_contains(config.ignored_files, name)
        end,
      },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<a-t>", ":ToggleTerm<cr>", desc = "toggle terminal" },
    },
    init = function()
      if util.on_windows then
        vim.o.shell = "pwsh"
        vim.o.shellcmdflag =
          "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
        vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
        vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
        vim.o.shellquote = ""
        vim.o.shellxquote = ""
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "toggleterm",
        callback = function()
          vim.opt_local.foldcolumn = "0"
        end,
      })
    end,
    opts = {
      open_mapping = "<a-t>",
      direction = "horizontal",
      size = 20,
      winbar = {
        enabled = true,
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    event = { "LazyFile" },
    opts = {
      should_enable = util.is_file,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "darazaki/indent-o-matic",
    event = { "LazyFile" },
    opts = {
      max_lines = 100,
      standar_widths = { 2, 4 },
    },
  },
}
