local util = require "util"

local function disable(_, bufnr)
  return not util.within_fsize(bufnr)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {},
      highlight = {
        enable = true,
        disable = disable,
      },
      indent = {
        enable = true,
        disable = disable,
      },
      endwise = {
        enable = true,
        disable = disable,
      },
      autotag = {
        enable = true,
        disable = disable,
      },
    },
    config = vim.schedule_wrap(function(_, opts)
      require("nvim-treesitter.install").compilers = { "clang", "cc", "gcc", "cl", "zig" }
      require("nvim-treesitter.install").prefer_git = false
      require("nvim-treesitter.configs").setup(opts)
    end),
    dependencies = {
      "rrethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },
}
