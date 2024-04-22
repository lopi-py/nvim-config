return {
  {
    "folke/neodev.nvim",
    ft = { "lua" },
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
