return {
  "folke/todo-comments.nvim",
  event = { "LazyFile" },
  keys = {
    { "]t", ":lua require('todo-comments').jump_next()<cr>" },
    { "[t", ":lua require('todo-comments').jump_prev()<cr>" },
  },
  opts = {
    signs = false,
    highlight = {
      after = "",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
