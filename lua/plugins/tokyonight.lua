return {
  "folke/tokyonight.nvim",
  opts = {
    on_highlights = function(hl)
      hl.PmenuExtra = "NonText"
      hl.BlinkCmpKindFile = "PmenuNormal"
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme "tokyonight"
  end,
}
