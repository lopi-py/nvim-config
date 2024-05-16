return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "clangd",
        "css-lsp",
        "debugpy",
        "eslint-lsp",
        "html-lsp",
        "java-debug-adapter",
        "java-test",
        "jdtls",
        "json-lsp",
        "lua-language-server",
        "luau-lsp",
        "prettierd",
        "pyright",
        "ruff-lsp",
        "rust-analyzer",
        "selene",
        "stylua",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
    init = function()
      vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. ":" .. vim.env.PATH
    end,
    config = function(_, opts)
      require("mason").setup()
      require("mason-tool-installer").setup {
        ensure_installed = opts.ensure_installed,
      }
    end,
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
}
