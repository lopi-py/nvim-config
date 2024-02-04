return {
  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    opts = {
      progress = {
        suppress_on_insert = true,
      },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    event = { "LazyFile" },
    opts = {
      open_fold_hl_timeout = 0,
    },
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "LazyFile" },
    main = "ibl",
    opts = {
      debounce = 50,
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
