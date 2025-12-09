return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    signs_staged = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
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
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end)
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end)
      map("n", "<leader>hS", gitsigns.stage_buffer)
      map("n", "<leader>hR", gitsigns.reset_buffer)
      map("n", "<leader>hp", gitsigns.preview_hunk)
      map("n", "<leader>hi", gitsigns.preview_hunk_inline)
      map("n", "<leader>hb", gitsigns.blame_line)
      map("n", "<leader>hd", gitsigns.diffthis)
      map("n", "<leader>hq", gitsigns.setqflist)
      map("n", "<leader>ub", gitsigns.toggle_current_line_blame)
      map({ "o", "x" }, "ih", gitsigns.select_hunk)
    end,
  },
}
