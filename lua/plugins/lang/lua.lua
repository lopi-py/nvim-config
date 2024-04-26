return {
  {
    "folke/neodev.nvim",
    event = { "LazyFile" },
    opts = {
      library = {
        plugins = false,
      },
      override = function(root_dir, library)
        if root_dir:find "nvim" or root_dir:find "neovim" then
          library.enabled = true
        end
      end,
    },
    config = function(_, opts)
      require("neodev").setup(opts)

      local lspconfig = require "lspconfig"
      local capabilities = require("lsp").capabilities

      lspconfig.lua_ls.setup {
        capabilities = capabilities(),
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      }
    end,
  },
}
