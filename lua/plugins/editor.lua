local config = require "config"
local icons = require "config.icons"
local util = require "util"

return {
  {
    "stevearc/oil.nvim",
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
      is_hidden_file = function(name)
        return vim.startswith(name, ".")
      end,
    },
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.uv.fs_stat(vim.fn.argv(0) --[[@as string]])
        if stat and stat.type == "directory" then
          require "oil"
        end
      end
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<a-t>", ":ToggleTerm<cr>", desc = "toggle terminal" },
      { "<leader>tr", ":ToggleTermSetName<cr>", desc = "rename terminal" },
      { "<leader>ts", ":TermSelect<cr>", desc = "select terminal" },
    },
    opts = {
      open_mapping = "<a-t>",
      direction = "float",
      highlights = {
        FloatBorder = { link = "FloatBorder" },
      },
      float_opts = {
        border = icons.border,
        width = function()
          return math.floor(vim.o.columns * config.terminal_size)
        end,
        height = function()
          return math.floor(vim.o.lines * config.terminal_size)
        end,
      },
    },
  },

  {
    "uga-rosa/ccc.nvim",
    event = { "LazyFile" },
    opts = {
      win_opts = {
        border = icons.border,
      },
      highlighter = {
        auto_enable = true,
        update_insert = true,
        max_byte = config.max_file_size,
        excludes = { "lazy" },
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
    "danymat/neogen",
    keys = {
      { "<leader>df", ":Neogen func<cr>", desc = "Generate function doc" },
      { "<leader>dF", ":Neogen file<cr>", desc = "Generate file doc" },
      { "<leader>dc", ":Neogen class<cr>", desc = "Generate class doc" },
      { "<leader>dt", ":Neogen type<cr>", desc = "Generate type doc" },
    },
    cmd = { "Neogen" },
    opts = {
      snippet_engine = "luasnip",
    },
  },

  {
    "axieax/urlview.nvim",
    keys = {
      { "<leader>fu", ":UrlView buffer<cr>", desc = "Find buffer urls" },
      { "<leader>fU", ":UrlView lazy<cr>", desc = "Find lazy urls" },
    },
    cmd = { "UrlView" },
    opts = {
      default_action = "system",
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

  {
    "folke/todo-comments.nvim",
    event = { "LazyFile" },
    keys = {
      {
        "]c",
        function()
          require("todo-comments").jump_next()
        end,
      },
      {
        "[c",
        function()
          require("todo-comments").jump_prev()
        end,
      },
    },
    opts = {
      signs = false,
      FIX = { icon = icons.debug },
      TODO = { icon = icons.check },
      HACK = { icon = icons.flame },
      WARN = { icon = icons.diagnostics.warn },
      PERF = { icon = icons.kind.Event },
      NOTE = { icon = icons.note },
      TEST = { icon = icons.test },
      highlight = {
        after = "",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
