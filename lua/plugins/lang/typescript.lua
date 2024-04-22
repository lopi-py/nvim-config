return {
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = function()
      local capabilities = require("lsp").capabilities

      return {
        capabilities = capabilities(),
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
