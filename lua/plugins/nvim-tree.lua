local config = require "config"
local icons = require "config.icons"

return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>e", ":NvimTreeToggle<cr>", desc = "File explorer" },
  },
  opts = {
    view = {
      width = 35,
      side = "right",
    },
    renderer = {
      special_files = {},
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          git = {
            unstaged = icons.git.unstaged,
            staged = icons.git.staged,
            unmerged = icons.git.conflict,
            renamed = icons.git.renamed,
            untracked = icons.git.untracked,
            deleted = icons.git.deleted,
            ignored = icons.git.ignored,
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      debounce_delay = 300,
      icons = {
        hint = icons.diagnostics.hint,
        info = icons.diagnostics.info,
        warning = icons.diagnostics.warn,
        error = icons.diagnostics.error,
      },
    },
    filesystem_watchers = {
      debounce_delay = 500,
    },
    filters = {
      custom = config.ignored_files,
    },
    notify = {
      threshold = vim.log.levels.WARN,
    },
  },
}
