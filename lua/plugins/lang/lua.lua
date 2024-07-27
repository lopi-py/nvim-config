return {
  {
    "folke/lazydev.nvim",
    event = "User FilePost",
    opts = {
      library = {
        "luvit-meta/library",
      },
      enabled = function(root_dir)
        return root_dir:find "nvim" or root_dir:find "neovim"
      end,
    },
  },

  { "Bilal2453/luvit-meta" },

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
