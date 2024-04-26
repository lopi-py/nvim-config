return {
  {
    "pmizio/typescript-tools.nvim",
    event = { "LazyFile" },
    opts = function()
      local capabilities = require("lsp").capabilities

      return {
        capabilities = capabilities(),
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}
