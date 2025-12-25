return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = "VeryLazy",
  config = function()
    local move = require "nvim-treesitter-textobjects.move"
    local select = require "nvim-treesitter-textobjects.select"
    local swap = require "nvim-treesitter-textobjects.swap"

    local map = vim.keymap.set

    map({ "n", "x", "o" }, "]f", function()
      move.goto_next_start("@function.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "]F", function()
      move.goto_next_end("@function.outer", "textobjects")
    end)

    map({ "n", "x", "o" }, "[f", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "[F", function()
      move.goto_previous_end("@function.outer", "textobjects")
    end)

    map({ "x", "o" }, "af", function()
      select.select_textobject("@function.outer", "textobjects")
    end)
    map({ "x", "o" }, "if", function()
      select.select_textobject("@function.inner", "textobjects")
    end)

    map("n", "<leader>a", function()
      swap.swap_next "@parameter.inner"
    end)
    map("n", "<leader>A", function()
      swap.swap_previous "@parameter.inner"
    end)
  end,
}
