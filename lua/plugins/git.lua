local config = require "config"
local icons = require "config.icons"

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "LazyFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame_opts = {
        delay = 500,
      },
      preview_config = {
        border = icons.border,
      },
      max_file_length = config.max_file_length,
      on_attach = function(bufnr)
        local gs = require "gitsigns"

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<cr>", "Stage hunk")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<cr>", "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function()
          gs.blame_line { full = true }
        end, "Blame Line")
        map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle current line blame")
        map("n", "<leader>hd", gs.diffthis, "Diff this")
        map("n", "<leader>td", gs.toggle_deleted, "Toggle deleted")
        map("n", "<leader>hD", function()
          gs.diffthis "~"
        end, "Diff this ~")
        map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>", "GitSigns select hunk")
      end,
    },
  },

  {
    "9seconds/repolink.nvim",
    keys = {
      { "<leader>gl", ":RepoLink!<cr>", mode = { "n", "v" } },
    },
    cmd = { "RepoLink" },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
      view = {
        default = {
          winbar_info = true,
        },
        file_history = {
          winbar_info = true,
        },
      },
    },
  },

  {
    "pwntester/octo.nvim",
    keys = {
      { "<leader>o", ":Octo actions<cr>" },
    },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
  },
}
