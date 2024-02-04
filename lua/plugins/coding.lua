local util = require "util"

return {
  {
    "garymjr/nvim-snippets",
    event = { "InsertEnter" },
    opts = {
      friendly_snippets = true,
      search_paths = {
        util.path_join(vim.fn.stdpath "config" --[[@as string]], "snippets"),
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
