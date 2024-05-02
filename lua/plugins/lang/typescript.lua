return {
  {
    "pmizio/typescript-tools.nvim",
    event = { "LazyFile" },
    opts = function()
      local capabilities = require("lsp").capabilities

      return {
        capabilities = capabilities(),
        settings = {
          expose_as_code_action = "all",
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}
