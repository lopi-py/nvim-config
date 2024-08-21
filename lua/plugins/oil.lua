return {
  "stevearc/oil.nvim",
  keys = {
    { "-", "<cmd>Oil<cr>" },
    { "_", "<cmd>Oil .<cr>" },
  },
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == ".." or name == ".git"
      end,
    },
  },
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.uv.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("lazy").load { plugins = { "oil.nvim" } }
      end
    end
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
