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
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      integrations = {
        fidget = true,
        mason = true,
        neotest = true,
        notify = true,
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
    "rebelot/kanagawa.nvim",
    opts = {
      compile = true,
    },
  },
}
