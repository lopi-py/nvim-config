return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  lazy = vim.fn.argc(-1) == 0,
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "blade",
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
      "php",
      "python",
      "query",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    highlight = {
      enable = true,
      -- NOTE: php indent needs vim regex enabled to work properly
      additional_vim_regex_highlighting = { "php" },
    },
    -- NOTE: forces a re-parse, which negates the benefit of async parsing
    -- indent = {
    --   enable = true,
    -- },
  },
}
