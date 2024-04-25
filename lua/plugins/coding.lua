return {
  {
    "garymjr/nvim-snippets",
    event = { "InsertEnter" },
    opts = {
      friendly_snippets = true,
      search_paths = {
        vim.fn.stdpath "config" .. "/snippets",
      },
    },
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    event = { "LazyFile" },
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
