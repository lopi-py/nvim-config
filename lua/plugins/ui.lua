return {
  {
    "kevinhwang91/nvim-ufo",
    event = { "VeryLazy" },
    opts = {
      open_fold_hl_timeout = 0,
    },
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "VeryLazy" },
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = {
        enabled = false,
      },
    },
  },
}
