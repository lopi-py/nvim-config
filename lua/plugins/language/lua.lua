return {
  {
    "folke/lazydev.nvim",
    event = "User FilePost",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
    dependencies = {
      "Bilal2453/luvit-meta",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end,
  },
}
