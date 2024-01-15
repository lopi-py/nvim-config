return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      lualine_bold = true,
      styles = {
        keywords = { bold = true, italic = false },
      },
      on_highlights = function(highlights, colors)
        local custom_highlights = {
          TelescopePromptTitle = { fg = colors.bg, bg = colors.blue },
          TelescopePromptPrefix = { fg = colors.blue, bg = colors.fg_gutter },
          TelescopePromptCounter = { fg = colors.dark5, bg = colors.fg_gutter },
          TelescopePromptNormal = { fg = colors.fg, bg = colors.fg_gutter },
          TelescopePromptBorder = { fg = colors.fg_gutter, bg = colors.fg_gutter },

          TelescopePreviewTitle = { fg = colors.bg, bg = colors.green2 },
          TelescopePreviewNormal = { fg = colors.fg, bg = colors.bg_dark },
          TelescopePreviewBorder = { fg = colors.bg_dark, bg = colors.bg_dark },

          TelescopeResultsTitle = { fg = colors.bg_highlight, bg = colors.bg_highlight },
          TelescopeResultsNormal = { fg = colors.fg, bg = colors.bg_highlight },
          TelescopeResultsBorder = { fg = colors.bg_highlight, bg = colors.bg_highlight },
        }

        for name, def in pairs(custom_highlights) do
          highlights[name] = def
        end
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme "tokyonight"
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        italic = false,
      },
      highlight_groups = {
        TelescopeSelection = { fg = "text", bg = "highlight_med" },
        TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
        TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

        TelescopePromptTitle = { fg = "base", bg = "love" },
        TelescopePromptPrefix = { fg = "love", bg = "surface" },
        TelescopePromptBorder = { fg = "surface", bg = "surface" },

        TelescopeResultsTitle = { fg = "overlay", bg = "overlay" },
        TelescopeResultsNormal = { fg = "text", bg = "overlay" },
        TelescopeResultsBorder = { fg = "overlay", bg = "overlay" },

        TelescopePreviewTitle = { fg = "base", bg = "rose" },
        TelescopePreviewNormal = { fg = "text", bg = "highlight_low" },
        TelescopePreviewBorder = { fg = "highlight_low", bg = "highlight_low" },
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
      custom_highlights = function(colors)
        return {
          TelescopePromptTitle = { fg = colors.crust, bg = colors.red },
          TelescopePromptPrefix = { fg = colors.red, bg = colors.surface0 },
          TelescopePromptNormal = { fg = colors.text, bg = colors.surface0 },
          TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },

          TelescopePreviewTitle = { fg = colors.crust, bg = colors.blue },
          TelescopePreviewNormal = { fg = colors.text, bg = colors.crust },
          TelescopePreviewBorder = { fg = colors.crust, bg = colors.crust },

          TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
          TelescopeResultsNormal = { fg = colors.text, bg = colors.mantle },
          TelescopeResultsBorder = { fg = colors.mantle, bg = colors.mantle },

          TelescopeSelection = { fg = colors.text, bg = colors.surface1 },
          TelescopeSelectionCaret = { fg = colors.red, bg = colors.surface1 },
          TelescopeMultiSelection = { fg = colors.text, bg = colors.surface0 },
        }
      end,
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    opts = {
      colors = {
        dark = {
          telescope_prompt = "require('onedarkpro.helpers').darken('bg', 1, 'onedark')",
          telescope_results = "require('onedarkpro.helpers').darken('bg', 4, 'onedark')",
          telescope_preview = "require('onedarkpro.helpers').darken('bg', 6, 'onedark')",
          telescope_selection = "require('onedarkpro.helpers').darken('bg', 8, 'onedark')",
        },
        light = {
          telescope_prompt = "require('onedarkpro.helpers').darken('bg', 2, 'onelight')",
          telescope_results = "require('onedarkpro.helpers').darken('bg', 5, 'onelight')",
          telescope_preview = "require('onedarkpro.helpers').darken('bg', 7, 'onelight')",
          telescope_selection = "require('onedarkpro.helpers').darken('bg', 9, 'onelight')",
        },
      },
      highlights = {
        TelescopeBorder = {
          fg = "${telescope_results}",
          bg = "${telescope_results}",
        },
        TelescopePromptBorder = {
          fg = "${telescope_prompt}",
          bg = "${telescope_prompt}",
        },
        TelescopePromptCounter = { fg = "${comment}" },
        TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
        TelescopePromptPrefix = {
          fg = "${purple}",
          bg = "${telescope_prompt}",
        },
        TelescopePromptTitle = {
          fg = "${telescope_prompt}",
          bg = "${purple}",
        },
        TelescopePreviewTitle = {
          fg = "${telescope_results}",
          bg = "${green}",
        },
        TelescopeResultsTitle = {
          fg = "${telescope_results}",
          bg = "${telescope_results}",
        },
        TelescopeMatching = { fg = "${blue}" },
        TelescopeNormal = { bg = "${telescope_results}" },
        TelescopeSelection = { bg = "${telescope_selection}" },
        TelescopePreviewNormal = { bg = "${telescope_preview}" },
        TelescopePreviewBorder = { fg = "${telescope_preview}", bg = "${telescope_preview}" },
      },
    },
  },
}
