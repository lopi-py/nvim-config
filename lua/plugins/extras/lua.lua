return {
  "folke/neodev.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "lua" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        lua_ls = function()
          require("neodev").setup {
            library = {
              plugins = false,
            },
            override = function(root_dir, library)
              if root_dir:find "nvim" or root_dir:find "neovim" then
                library.enabled = true
              end
            end,
          }
        end,
      },

      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        lua = { "selene" },
      },
    },
  },
}
