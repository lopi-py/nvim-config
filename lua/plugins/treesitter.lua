return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "LazyFile" },
  main = "nvim-treesitter.configs",
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
      "python",
      "query",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<cr>",
        scope_incremental = "<cr>",
        node_incremental = "<tab>",
        node_decremental = "<s-tab>",
      },
    },
  },
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require "nvim-treesitter.query_predicates"
  end,
}
