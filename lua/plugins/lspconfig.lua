return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  config = function()
    vim.lsp.enable {
      "clangd",
      "cssls",
      "dartls",
      "emmet_language_server",
      "emmylua_ls",
      "eslint",
      "html",
      "intelephense",
      "jdtls",
      "jsonls",
      "lemminx",
      "qmlls",
      "ruff",
      "rust_analyzer",
      "tailwindcss",
      "tsgo",
      "ty",
      "yamlls",
      "zls",
    }
  end,
  dependencies = {
    "b0o/SchemaStore.nvim",
  },
}
