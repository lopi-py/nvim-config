local config = require "config"
local icons = require "config.icons"

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", ":Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fw", ":Telescope live_grep<cr>", desc = "Find word" },
      {
        "<leader>fb",
        ":Telescope current_buffer_fuzzy_find<cr>",
        desc = "Fuzzy find buffer",
      },
      { "<leader>fB", ":Telescope buffers<cr>", desc = "Find buffers" },
    },
    cmd = { "Telescope" },
    config = function()
      local actions = require "telescope.actions"

      require("telescope").setup {
        defaults = {
          file_ignore_pattern = config.ignored_files,
          borderchars = {
            icons.border[2],
            icons.border[4],
            icons.border[6],
            icons.border[8],
            icons.border[1],
            icons.border[3],
            icons.border[5],
            icons.border[7],
          },
          mappings = {
            i = {
              ["<c-k>"] = actions.move_selection_previous,
              ["<c-j>"] = actions.move_selection_next,
            },
            n = {
              q = actions.close,
              t = actions.file_tab,
              s = actions.file_split,
              v = actions.file_vsplit,
            },
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
