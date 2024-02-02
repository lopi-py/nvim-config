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
}
