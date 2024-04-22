return {
  {
    "lopi-py/luau-lsp.nvim",
    ft = { "luau" },
    opts = function()
      local capabilities = require("lsp").capabilities

      return {
        server = {
          capabilities = capabilities(),
          settings = {
            ["luau-lsp"] = {
              ignoreGlobs = { "**/_Index/**", "**/node_modules/**" },
              completion = {
                imports = {
                  enabled = true,
                },
              },
              inlayHints = {
                functionReturnTypes = true,
                parameterTypes = true,
              },
            },
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
