return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  config = function()
    require "config.lsp"

    vim.lsp.enable {
      "basedpyright",
      "clangd",
      "copilot",
      "cssls",
      "emmet_language_server",
      "emmylua_ls",
      "eslint",
      "html",
      "intelephense",
      "jdtls",
      "jsonls",
      "lemminx",
      "ruff",
      "rust_analyzer",
      "tailwindcss",
      "vtsls",
      "yamlls",
      "zls",
    }
  end,
  dependencies = {
    "b0o/SchemaStore.nvim",
  },
}
