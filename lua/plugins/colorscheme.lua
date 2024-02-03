return {
  {
    "folke/tokyonight.nvim",
    opts = {
      lualine_bold = true,
      styles = {
        keywords = { bold = true, italic = false },
      },
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        italic = false,
      },
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      integrations = {
        fidget = true,
        mason = true,
        neotree = true,
        neotest = true,
        notify = true,
        window_picker = true,
        octo = true,
        lsp_trouble = true,
        illuminate = true,
      },
      styles = {
        conditionals = { "bold" },
        loops = { "bold" },
        keywords = { "bold" },
        booleans = { "bold" },
      },
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    opts = {},
  },

  {
    "EdenEast/nightfox.nvim",
    opts = {},
  },
}
