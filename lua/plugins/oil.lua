local config = require "config"

return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", ":Oil<cr>", desc = "Open parent directory" },
      {
        "_",
        function()
          require("oil").open(vim.uv.cwd())
        end,
        desc = "Open currenty working directory",
      },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          return name == ".." or vim.list_contains(config.ignored_files, name)
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
  },
}
