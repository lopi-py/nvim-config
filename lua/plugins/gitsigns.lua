return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require "gitsigns"

      local function map(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
      end

      map("n", "]h", function()
        gitsigns.nav_hunk "next"
      end)
      map("n", "[h", function()
        gitsigns.nav_hunk "prev"
      end)
      map("n", "<leader>hs", gitsigns.stage_hunk)
      map("n", "<leader>hr", gitsigns.reset_hunk)
      map("n", "<leader>hS", gitsigns.stage_buffer)
      map("n", "<leader>hR", gitsigns.reset_buffer)
      map("n", "<leader>hu", gitsigns.undo_stage_hunk)
      map("n", "<leader>hp", gitsigns.preview_hunk)
      map("n", "<leader>hb", gitsigns.blame_line)
      map("n", "<leader>hd", gitsigns.diffthis)
      map("n", "<leader>ub", gitsigns.toggle_current_line_blame)
      map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")
    end,
  },
}
