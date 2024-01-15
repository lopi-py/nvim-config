vim.filetype.add {
  filename = {
    [".luaurc"] = "json",
  },
}

return {
  {
    "lopi-py/luau-lsp.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "luau" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        luau_lsp = function(opts)
          require("luau-lsp").setup {
            server = opts,
          }
          return true
        end,
      },

      servers = {
        luau_lsp = {
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
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        luau = { "stylua" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        luau = { "selene" },
      },
    },
  },
}
