return {
  {
    "mrcjkb/rustaceanvim",
    event = { "LazyFile" },
    opts = function()
      local capabilities = require("lsp").capabilities

      return {
        server = {
          capabilities = capabilities(),
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
}
