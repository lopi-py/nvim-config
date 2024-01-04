return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {},
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      integrations = {
        dropbar = {
          enabled = true,
          color_mode = true,
        },
        fidget = true,
        mason = true,
        neotree = true,
        neotest = true,
        noice = true,
        notify = true,
        window_picker = true,
        octo = true,
        lsp_trouble = true,
        illuminate = true,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "bold" },
        loops = { "bold" },
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = {},
        operators = {},
      },
    },
  },

  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      filter = "spectrum",
    },
  },
}
