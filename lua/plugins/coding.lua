return {
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    event = { "VeryLazy" },
    opts = {},
  },

  {
    "max397574/better-escape.nvim",
    event = { "InsertEnter" },
    opts = {
      mapping = { "jj", "jk" },
    },
  },
}
