local config = require "config"

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "VeryLazy" },
    opts = {
      signs = {
        add = { text = "▍" },
        change = { text = "▍" },
        changedelete = { text = "▍" },
        untracked = { text = "▍" },
      },
      current_line_blame_opts = {
        delay = 500,
      },
      max_file_length = config.max_file_length,
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
        end

        map("n", "]h", gitsigns.next_hunk)
        map("n", "[h", gitsigns.prev_hunk)
        map("n", "<leader>hs", gitsigns.stage_hunk)
        map("n", "<leader>hr", gitsigns.reset_hunk)
        map("n", "<leader>hu", gitsigns.undo_stage_hunk)
        map("n", "<leader>hS", gitsigns.stage_buffer)
        map("n", "<leader>hR", gitsigns.reset_buffer)
        map("n", "<leader>hp", gitsigns.preview_hunk)
        map("n", "<leader>hb", gitsigns.blame_line)
        map("n", "<leader>hd", gitsigns.diffthis)
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
        map("n", "<leader>td", gitsigns.toggle_deleted)
        map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")
      end,
    },
  },

  {
    "linrongbin16/gitlinker.nvim",
    keys = {
      { "<leader>gy", ":GitLink file<cr>" },
      { "<leader>gY", ":GitLink! file<cr>" },
      { "<leader>gy", ":GitLink<cr>", mode = { "v" } },
      { "<leader>gY", ":GitLink!<cr>", mode = { "v" } },
    },
    cmd = { "GitLink" },
    opts = {
      message = false,
      router = {
        file = {
          ["^github%.com"] = "https://github.com/{_A.ORG}/{_A.REPO}/blob/{_A.REV}/{_A.FILE}",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
