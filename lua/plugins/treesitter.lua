local util = require "util"

local function disable(_, bufnr)
  return not util.within_fsize(bufnr)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "LazyFile" },
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "css",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luau",
        "markdown",
        "markdown_inline",
        "query",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = {
        enable = true,
        disable = disable,
      },
      indent = {
        enable = true,
        disable = disable,
      },
      incremental_selection = {
        enable = true,
        disable = disable,
        keymaps = {
          init_selection = "<cr>",
          scope_incremental = "<cr>",
          node_incremental = "<tab>",
          node_decremental = "<s-tab>",
        },
      },
      autotag = {
        enable = true,
        disable = disable,
      },
      endwise = {
        enable = true,
        disable = disable,
      },
    },
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require "nvim-treesitter.query_predicates"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
  },
}
