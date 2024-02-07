local prettier = { "prettierd", "prettier" }

return {
  "pmizio/typescript-tools.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "typescript", "tsx", "javascript" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        tsserver = function()
          require("typescript-tools").setup {}
          return true
        end,
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { prettier },
        typescript = { prettier },
        javascriptreact = { prettier },
        typescriptreact = { prettier },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- I already use eslint-lsp which gives me fixes as code actions
        -- javascript = { "eslint_d" },
        -- typescript = { "eslint_d" },
        -- javascriptreact = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },
      },
    },
  },
}
