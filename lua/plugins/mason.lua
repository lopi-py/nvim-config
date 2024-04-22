return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "clangd",
        "lua-language-server",
        "luau-lsp",
        "json-lsp",
        "yaml-language-server",
        "typescript-language-server",
        "jdtls",
        "stylua",
        "selene",
        "prettierd",
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
