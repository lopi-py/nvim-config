return {
  "stevearc/dressing.nvim",
  lazy = true,
  opts = {
    select = {
      backend = "fzf_lua",
    },
  },
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      vim.ui.select(...)
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      vim.ui.input(...)
    end
  end,
}
