return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "clangd",
        "debugpy",
        "emmet-ls",
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
        "selene",
        "stylua",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-tool-installer").setup {
        ensure_installed = opts.ensure_installed,
      }
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
}
