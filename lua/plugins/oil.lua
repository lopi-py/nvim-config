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
        return name == ".."
      end,
    },
  },
  init = function()
    local path = vim.fn.argv(0) ---@cast path string
    local stat = vim.uv.fs_stat(path)
    if stat and stat.type == "directory" then
      require "oil"
    end
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
