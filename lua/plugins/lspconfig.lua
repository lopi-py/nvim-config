return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  config = function()
    require "config.lsp"

    vim.lsp.enable {
      "clangd",
      "cssls",
      "emmet_language_server",
      "eslint",
      "html",
      "intelephense",
      "jsonls",
      "lemminx",
      "lua_ls",
      "pyright",
      "ruff",
      "rust_analyzer",
      "tailwindcss",
      "taplo",
      "vtsls",
      "yamlls",
      "zls",
    }
  end,
  dependencies = {
    "b0o/SchemaStore.nvim",
  },
}
