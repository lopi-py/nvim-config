return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    -- TODO: remove when https://github.com/lewis6991/gitsigns.nvim/pull/1439 is merged
    status_formatter = function(status)
      local status_txt = {}
      if status.added and status.added > 0 then
        table.insert(status_txt, "%#GitSignsAdd#+" .. status.added .. "%##")
      end
      if status.changed and status.changed > 0 then
        table.insert(status_txt, "%#GitSignsChange#~" .. status.changed .. "%##")
      end
      if status.removed and status.removed > 0 then
        table.insert(status_txt, "%#GitSignsDelete#-" .. status.removed .. "%##")
      end
      return table.concat(status_txt, " ")
    end,
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
